<script>
export default {
    layout: AppLayout,
};
</script>
<script setup>
import { string } from "vue-types";
import { ref, onMounted } from "vue";
import axios from "axios";
import { notify } from "notiwind";

import AppLayout from "@/layouts/AppLayout.vue";
import Spinner from "@/components/icons/Spinner.vue";

const props = defineProps({
    slug: string(),
});

const isLoading = ref(false);
const data = ref({});

const getData = () => {
    axios
        .get(route("app.madings.get-data-detail", props.slug))
        .then((res) => {
            data.value = res.data;
        })
        .catch((err) => {
            if (err.response.status === 404) {
                data.value = "NOT_FOUND";
            } else {
                notify(
                    {
                        group: "top",
                        text: err.response.data.message,
                        type: "error",
                    },
                    2500
                );
            }
        })
        .finally(() => (isLoading.value = false));
};

onMounted(() => {
    isLoading.value = true;
    getData();
});
</script>
<template>
    <div
        v-if="!isLoading && data !== 'NOT_FOUND'"
        class="w-full flex flex-col gap-20"
    >
        <div class="mt-8">
            <h1 class="text-3xl font-semibold">{{ data.title }}</h1>
        </div>
        <div class="w-full h-[320px]">
            <img
                :src="data.thumbnail"
                class="object-contain w-full h-full"
                alt="Thumbnail"
            />
        </div>
        <div class="w-full flex justify-between items-center">
            <div>
                <p class="text-sm">Author : {{ data.author }}</p>
            </div>
            <div>
                <p class="text-sm">{{ data.published_at }}</p>
            </div>
        </div>
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
        <h1 class="font-semibold text-2xl">Mading Not Found</h1>
    </div>
    <!-- Loading State -->
    <div v-else class="w-full h-screen flex justify-center items-center">
        <Spinner class="w-12 h-12" />
    </div>
</template>
