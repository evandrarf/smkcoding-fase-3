<script>
export default {
    layout: AppLayout,
};
</script>
<script setup>
import { Head } from "@inertiajs/inertia-vue3";
import { string, object } from "vue-types";
import { ref, onMounted, watchEffect } from "vue";
import axios from "axios";
import { notify } from "notiwind";
import { Inertia } from "@inertiajs/inertia";

import AppLayout from "@/layouts/AppLayout.vue";
import Upload from "@/components/icons/Upload.vue";
import ImageDragDrop from "@/components/ImageDragDrop.vue";
import Editor from "@/components/Editor.vue";
import VInput from "@/components/Input.vue";
import Spinner from "@/components/icons/Spinner.vue";

const props = defineProps({
    slug: string(),
    user: object().def({}),
});

const form = ref({
    image: null,
    content: "",
    title: "",
    priority: "normal",
    published_at: "",
});
const isLoading = ref(false);
const showInputDate = ref(true);
const editorComponent = ref(null);
const isLoadingGetData = ref(false);
const error = ref(null);

const handleChangeFileDrop = (files) => {
    form.value.image = files[0];
};

const handleChangeFile = (e) => {
    form.value.image = e.target.files[0];
};

const getData = () => {
    axios
        .get(route("app.madings.get-data-detail", props.slug))
        .then((res) => {
            if (res.data.user_id !== props.user.id) {
                error.value = "You are not authorized to edit this mading";
            }
            form.value = res.data;
            form.value.priority = res.data.priority.toLowerCase();
            form.value.published_at = res.data.published_at_datetime;
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
        .finally(() => (isLoadingGetData.value = false));
};

const handleUpload = () => {
    isLoading.value = true;
    const formData = new FormData();
    if (form.value.image !== null) {
        formData.append("file", form.value.image);
    }
    formData.append("content", form.value.content);
    formData.append("title", form.value.title);
    formData.append("priority", form.value.priority);
    formData.append("published_at", form.value.published_at);

    axios
        .post(route("app.madings.update", form.value.slug), formData)
        .then((res) => {
            notify(
                {
                    group: "top",
                    text: res.data.message,
                    type: "success",
                },
                2500
            );
            Inertia.visit(route("app.madings.detail", res.data.data.slug));
            form.value = {
                image: null,
                content: "",
                title: "",
                priority: "normal",
                published_at: "",
            };
            editorComponent.value.clearContent();
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
        .finally(() => (isLoading.value = false));
};

const handleUpdateContent = (content) => {
    form.value.content = content;
};

onMounted(() => {
    isLoadingGetData.value = true;
    getData();
});

// watchEffect(() => {
//     if (editorComponent.value) {
//         editorComponent.value.setContent(form.value.content);
//     }
// });
</script>
<template>
    <Head title="Home | STEMBA MADING" />
    <div
        v-if="!isLoading && error"
        class="w-full h-full flex justify-center items-center"
    >
        <h1 class="text-3xl font-semibold">{{ error }}</h1>
    </div>
    <div
        v-else-if="isLoadingGetData"
        class="w-full h-full flex justify-center items-center"
    >
        <Spinner class="w-12 h-12" />
    </div>
    <div v-else class="flex flex-col w-full">
        <div class="flex justify-between items-center">
            <h1 class="text-4xl font-semibold">Edit</h1>
            <div>
                <button
                    class="py-2 px-4 mt-6 w-full text-white rounded"
                    :class="
                        isLoading
                            ? 'bg-gray-400 cursor-not-allowed'
                            : 'bg-blue-500'
                    "
                    @click="handleUpload"
                >
                    {{
                        isLoading
                            ? "Loading..."
                            : form.status?.toLowerCase() === "rejected"
                            ? "Edit & Resend"
                            : "Edit"
                    }}
                </button>
            </div>
        </div>
        <div class="w-1/3 mt-12">
            <VInput
                :model-value="form.title"
                @update:model-value="(newValue) => (form.title = newValue)"
                placeholder="Input title..."
                name="Title"
            />
            <div class="mt-6">
                <label>
                    <p class="text-gray-600 text-sm">Priority</p>
                    <select class="mt-2" v-model="form.priority">
                        <option value="normal">Normal</option>
                        <option value="important">Important</option>
                    </select>
                </label>
            </div>
            <div class="mt-6" v-if="form.status?.toLowerCase() !== 'published'">
                <div class="flex">
                    <p class="text-gray-600 text-sm">
                        Want to schedule this mading?
                    </p>
                    <input
                        type="checkbox"
                        class="ml-4"
                        v-model="showInputDate"
                    />
                </div>
                <div v-show="showInputDate" class="mt-5">
                    <input type="datetime-local" v-model="form.published_at" />
                </div>
            </div>
        </div>
        <div class="flex flex-col w-full my-16 gap-16">
            <ImageDragDrop @files-dropped="handleChangeFileDrop">
                <label
                    class="w-full border-2 border-blue-400 rounded cursor-pointer flex relative justify-center items-center py-6"
                >
                    <div class="flex items-center gap-4">
                        <Upload class="w-8 h-8 text-blue-700" />
                        <p class="font-lg text-blue-700 font-semibold">
                            Upload Thumbnail
                        </p>
                        <p v-if="form.image">{{ form.image.name }}</p>
                    </div>
                    <input
                        type="file"
                        accept="image/*"
                        class="opacity-0 inset-0 absolute"
                        @change="handleChangeFile"
                    />
                </label>
            </ImageDragDrop>
            <Editor
                :content="form.content"
                ref="editorComponent"
                @update:content="handleUpdateContent"
            />
        </div>
    </div>
</template>
