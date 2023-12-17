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
import MadingCard from "@/components/MadingCard.vue";
import Spinner from "@/components/icons/Spinner.vue";
import RightArrowLong from "@/components/icons/RightArrowLong.vue";

const dataImportantMading = ref([]);
const importantMadingLoading = ref(false);

const dataOtherMading = ref([]);
const otherMadingLoading = ref(false);

const getOtherMadingData = () => {
    otherMadingLoading.value = true;
    axios
        .get(route("app.madings.get-data"), {
            params: {
                priority: "normal",
                status: "published",
                limit: 4,
            },
        })
        .then((response) => {
            dataOtherMading.value = response.data.data;
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
            otherMadingLoading.value = false;
        });
};

const getImportantMadingData = () => {
    importantMadingLoading.value = true;
    axios
        .get(route("app.madings.get-data"), {
            params: {
                priority: "important",
                status: "published",
                limit: 4,
            },
        })
        .then((response) => {
            dataImportantMading.value = response.data.data;
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
            importantMadingLoading.value = false;
        });
};

onMounted(() => {
    getOtherMadingData();
    getImportantMadingData();
});
</script>
<template>
    <Head title="Home | STEMBA MADING" />
    <div class="w-full min-h-screen h-min flex flex-col">
        <div class="w-full mt-8 mb-16">
            <h1 class="text-4xl font-semibold">STEMBA MADING</h1>
            <p class="mt-4">
                Stemba Mading is an innovative application designed to transform
                and modernize the traditional concept of school bulletin boards,
                commonly known as "mading" in Indonesian educational settings.
                Developed specifically for schools under the umbrella of STEMBA,
                this digital solution aims to streamline and enhance the
                management of school announcements, notices, and updates.
            </p>
        </div>
        <div class="flex flex-col h-full w-full">
            <div class="flex justify-between items-center">
                <h2 class="font-medium text-2xl">Important Madings</h2>
                <Link class="text-blue-500" :href="route('app.madings.index')"
                    >More <RightArrowLong class="ml-2" />
                </Link>
            </div>
            <div class="overflow-x-auto w-full h-min mt-8">
                <div
                    class="h-full flex gap-6 items-center"
                    :class="{
                        'justify-center': importantMadingLoading,
                    }"
                >
                    <Spinner v-if="importantMadingLoading" class="h-10 w-10" />
                    <h3
                        v-else-if="dataImportantMading.length < 1"
                        class="self-start mt-6"
                    >
                        There is no important mading
                    </h3>
                    <MadingCard
                        v-else
                        v-for="(mading, index) in dataImportantMading"
                        :key="index"
                        :data="mading"
                    />
                </div>
            </div>
        </div>
        <div class="flex flex-col h-full w-full my-24">
            <div class="flex justify-between items-center">
                <h2 class="font-medium text-2xl">Other Madings</h2>
                <Link class="text-blue-500" :href="route('app.madings.index')"
                    >More <RightArrowLong class="ml-2" />
                </Link>
            </div>
            <div class="overflow-x-auto w-full h-min mt-8">
                <div
                    class="h-full flex gap-6 items-center"
                    :class="{
                        'justify-center': otherMadingLoading,
                    }"
                >
                    <Spinner v-if="otherMadingLoading" class="h-10 w-10" />
                    <h3
                        v-else-if="dataOtherMading.length < 1"
                        class="self-start mt-6"
                    >
                        There is no other mading
                    </h3>
                    <MadingCard
                        v-else
                        v-for="(mading, index) in dataOtherMading"
                        :key="index"
                        :data="mading"
                    />
                </div>
            </div>
        </div>
    </div>
</template>
