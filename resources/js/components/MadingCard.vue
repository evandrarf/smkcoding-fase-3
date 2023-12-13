<script setup>
import { object } from "vue-types";
import { Link } from "@inertiajs/inertia-vue3";

import Badge from "@/components/Badge.vue";

const props = defineProps({
    data: object(),
});

const badgeColor = {
    important: "red",
    normal: "green",
};
</script>

<template>
    <Link :href="route('app.madings.detail', data.slug)" class="h-96">
        <div class="h-full flex flex-col gap-3 w-[250px]">
            <div class="h-2/3 overflow-hidden">
                <img
                    :src="data.thumbnail"
                    alt="mading image"
                    class="object-contain w-full h-full"
                />
            </div>
            <div class="h-1/3">
                <h3 class="text-md font-semibold truncate">{{ data.title }}</h3>
                <div class="flex justify-between my-2">
                    <span class="text-xs text-gray-600 font-medium">{{
                        data.author
                    }}</span>
                    <span class="text-xs text-gray-500">{{
                        data.published_at_time
                    }}</span>
                </div>
                <div class="flex justify-between items-center gap-2">
                    <span class="text-xs text-gray-400">{{
                        data.published_at
                    }}</span>
                    <Badge
                        size="sm"
                        :color="badgeColor[data.priority?.toLowerCase()]"
                        :text="data.priority"
                    />
                </div>
            </div>
        </div>
    </Link>
</template>
