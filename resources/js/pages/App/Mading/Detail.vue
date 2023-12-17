<script>
export default {
    layout: AppLayout,
};
</script>
<script setup>
import { string, object } from "vue-types";
import { ref, onMounted } from "vue";
import axios from "axios";
import { notify } from "notiwind";
import { Head, Link } from "@inertiajs/inertia-vue3";
import { Inertia } from "@inertiajs/inertia";

import AppLayout from "@/layouts/AppLayout.vue";
import Spinner from "@/components/icons/Spinner.vue";
import DropDownEditMenu from "@/components/DropDownEditMenu.vue";
import Edit from "@/components/icons/Edit.vue";
import Bookmark from "@/components/icons/Bookmark.vue";
import DeleteModal from "@/components/DeleteModal.vue";
import Trash from "@/components/icons/Trash.vue";
import BookmarkOutline from "@/components/icons/BookmarkOutline.vue";

const props = defineProps({
    slug: string(),
    user: object().def({}),
    role: string(),
});

const isLoading = ref(false);
const data = ref({});
const error = ref(null);
const showDeleteModal = ref(false);
const deleteLoading = ref(false);
const is_saved = ref(false);

const getIsSaved = () => {
    axios
        .get(
            route("app.bookmarks.check-is-bookmarked", {
                mading_id: data.value.id,
            })
        )
        .then((res) => {
            is_saved.value = res.data.data.is_bookmarked;
        })
        .catch((err) => {
            console.log(err);
            notify(
                {
                    group: "top",
                    text: err.response.data.message,
                    type: "error",
                },
                2500
            );
        });
};

const handleToogleBookmark = () => {
    axios
        .post(route("app.bookmarks.toggle-bookmark"), {
            mading_id: data.value.id,
        })
        .then((res) => {
            notify(
                {
                    group: "top",
                    text: res.data.message,
                    type: "success",
                },
                2500
            );
            getIsSaved();
        })
        .catch((err) => {
            console.log(err);
            notify(
                {
                    group: "top",
                    text: err.response.data.message,
                    type: "error",
                },
                2500
            );
        });
};

const getData = () => {
    axios
        .get(route("app.madings.get-data-detail", props.slug))
        .then((res) => {
            data.value = res.data;

            if (props.user) getIsSaved();
        })
        .catch((err) => {
            console.log(err);
            notify(
                {
                    group: "top",
                    text: err.response.data.message,
                    type: "error",
                },
                2500
            );

            error.value = err.response.data.message;
        })
        .finally(() => (isLoading.value = false));
};

const handleDelete = () => {
    deleteLoading.value = true;
    axios
        .delete(route("app.madings.delete", data.value.id))
        .then((res) => {
            notify(
                {
                    group: "top",
                    text: res.data.message,
                    type: "success",
                },
                2500
            );
            Inertia.visit(route("app.madings.index"));
        })
        .catch((err) => {
            console.log(err);
            notify(
                {
                    group: "top",
                    text: err.response.data.message,
                    type: "error",
                },
                2500
            );
        })
        .finally(() => {
            deleteLoading.value = false;
            showDeleteModal.value = false;
        });
};

onMounted(() => {
    isLoading.value = true;
    getData();
});
</script>
<template>
    <Head title="Mading Detail | STEMBA MADING" />
    <div
        v-if="!isLoading && error === null"
        class="w-full flex flex-col gap-20"
    >
        <div class="w-full h-[500px] overflow-hidden relative">
            <img
                :src="data.thumbnail"
                class="object-cover w-full h-full"
                alt="Thumbnail"
            />
            <div class="absolute right-8 top-5">
                <DropDownEditMenu
                    class="relative inline-flex border border-gray-200 r-0 rounded-full shadow-xl"
                    :align="'right'"
                    :last="index === data.length - 1 ? true : false"
                >
                    <li class="cursor-pointer hover:bg-slate-100">
                        <Link
                            v-if="user && user?.id === data.user_id"
                            :href="route('app.madings.edit', data.slug)"
                            class="text-blue-500 flex justify-center items-center space-x-2 p-3"
                        >
                            <span>
                                <Edit />
                            </span>
                            <span>Edit</span>
                        </Link>
                    </li>
                    <li
                        class="cursor-pointer hover:bg-slate-100"
                        @click="handleToogleBookmark"
                    >
                        <div
                            class="flex justify-center text-blue-500 items-center space-x-2 p-3"
                        >
                            <span>
                                <Bookmark v-if="is_saved" />
                                <BookmarkOutline v-else />
                            </span>
                            <span v-if="is_saved">Saved</span>
                            <span v-else>Save</span>
                        </div>
                    </li>
                    <li
                        class="cursor-pointer hover:bg-slate-100"
                        v-if="
                            (user && user?.id === data.user_id) ||
                            role === 'admin'
                        "
                        @click="() => (showDeleteModal = true)"
                    >
                        <div
                            class="flex justify-center text-red-500 items-center space-x-2 p-3"
                        >
                            <span>
                                <Trash />
                            </span>
                            <span>Delete</span>
                        </div>
                    </li>
                </DropDownEditMenu>
            </div>
        </div>
        <div class="w-full flex gap-8 flex-col">
            <h1 class="text-6xl font-medium">{{ data.title }}</h1>
            <div class="font-medium flex justify-between items-center">
                <p class="text-gray-500 text-sm font-light">
                    By {{ data.author }} | {{ data.published_at }}
                    {{
                        data.published_at_time && `, ${data.published_at_time}`
                    }}
                </p>
                <p class="text-sm font-light">
                    <span
                        v-if="data.status"
                        :class="{
                            'text-green-500':
                                data.status?.toLowerCase() === 'published',
                            'text-yellow-500':
                                data.status?.toLowerCase() === 'draft' ||
                                data.status?.toLowerCase() === 'need review',
                            'text-red-500':
                                data.status?.toLowerCase() === 'rejected',
                        }"
                    >
                        {{ data.status }}
                    </span>
                    <span v-if="data.status"> | </span>
                    <span
                        :class="{
                            'text-blue-500':
                                data.priority?.toLowerCase() === 'normal',
                            'text-red-500':
                                data.priority?.toLowerCase() === 'important',
                        }"
                    >
                        {{ data.priority }}
                    </span>
                </p>
            </div>
        </div>
        <div class="h-0.5 w-full bg-gray-200"></div>
        <div
            class="prose max-w-full mb-24 leading-6 prose-slate"
            v-html="data.content"
        ></div>
    </div>
    <!-- Mading Not Found -->
    <div
        v-else-if="!isLoading"
        class="w-full h-4/5 flex justify-center items-center"
    >
        <h1 class="font-semibold text-2xl">{{ error }}</h1>
    </div>
    <!-- Loading State -->
    <div v-else class="w-full h-screen flex justify-center items-center">
        <Spinner class="w-12 h-12" />
    </div>
    <DeleteModal
        @close="() => (showDeleteModal = false)"
        @submit="handleDelete"
        :showModal="showDeleteModal"
        :isLoading="deleteLoading"
    />
</template>
