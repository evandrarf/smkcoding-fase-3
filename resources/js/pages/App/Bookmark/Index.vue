<script>
export default {
    layout: AppLayout,
};
</script>
<script setup>
import { Head, Link } from "@inertiajs/inertia-vue3";
import axios from "axios";
import { ref, onMounted } from "vue";
import { notify } from "notiwind";

import AppLayout from "@/layouts/AppLayout.vue";
import Sidebar from "./Sidebar.vue";
import MadingCard from "@/components/MadingCard.vue";
import Spinner from "@/components/icons/Spinner.vue";

import debounce from "@/composable/debounce";

const madings = ref([]);
const isLoading = ref(false);
const pagination = ref({
    count: "",
    current_page: "",
    per_page: "",
    total: 0,
    total_pages: 1,
});

const search = ref("");
const filter = ref({
    priority: "",
});

const getMading = debounce(async (page = 1) => {
    axios
        .get(route("app.bookmarks.get-data"), {
            params: {
                limit: 9,
                page: page,
                search: search.value,
                priority: filter.value.priority,
            },
        })
        .then((response) => {
            madings.value = response.data.data;
            pagination.value = response.data.meta.pagination;
        })
        .catch((error) => {
            console.log(error);
            notify(
                {
                    group: "top",
                    text: error.response.data.message,
                    type: "error",
                },
                2500
            );
        })
        .finally(() => {
            isLoading.value = false;
        });
}, 250);

const handleFilter = (data) => {
    filter.value = data;
    isLoading.value = true;
    getMading();
};

const handleChangePage = (page) => {
    isLoading.value = true;
    getMading(page);
};

const handleSearch = (data) => {
    isLoading.value = true;
    search.value = data;
    getMading();
};

onMounted(() => {
    isLoading.value = true;
    getMading();
});
</script>
<template>
    <Head title="Bookmark | STEMBA MADING" />
    <div class="w-full h-min min-h-screen flex relative">
        <main
            class="w-2/3 h-full grid gap-6 justify-center items-center"
            :class="{
                'grid-cols-1': isLoading,
                'grid-cols-3': !isLoading,
            }"
        >
            <div class="col-span-3">
                <h1 class="text-3xl font-semibold">Bookmark</h1>
            </div>
            <div
                v-if="!isLoading && madings.length === 0"
                class="col-span-full"
                :data="null"
            >
                <h3 class="text-xl font-semibold">There is no Mading</h3>
            </div>
            <MadingCard
                v-else-if="!isLoading"
                v-for="(mading, index) in madings"
                :key="index"
                :data="mading"
            />
            <Spinner v-else class="w-10 h-10" />
        </main>
        <Sidebar
            @filter="handleFilter"
            @search="handleSearch"
            @next="handleChangePage"
            @prev="handleChangePage"
            :pagination="pagination"
        />
    </div>
</template>
