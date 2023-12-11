<script setup>
import { string, array } from "vue-types";
import { Link } from "@inertiajs/inertia-vue3";

import Home from "@/components/icons/Home.vue";
import Plus from "@/components/icons/Plus.vue";
import Bookmark from "@/components/icons/Bookmark.vue";
import User from "@/components/icons/User.vue";

const props = defineProps({
    appName: string().def("PAPAP PENGUMUMAN DIGITAL SEKOLAH"),
    menus: array().def([]),
});

const getUrlPathName = (route) => {
    return new URL(route).pathname;
};

const icons = {
    Home,
    Plus,
    Bookmark,
    User,
};
</script>
<template>
    <nav
        class="w-full shadow-md sticky top-0 z-20 bg-white py-4 flex justify-center"
    >
        <div class="max-w-[80%] w-full flex justify-between items-center">
            <div class="flex items-center">
                <h2 class="font-semibold text-xl">{{ appName }}</h2>
                <div class="ml-6">
                    <input
                        type="search"
                        class="outline-none border-2 border-gray-300 px-3 py-1 rounded"
                        placeholder="Search mading"
                    />
                </div>
            </div>
            <div class="flex gap-4">
                <Link
                    class="ml-6 flex gap-1 items-center flex-col"
                    v-for="(menu, index) in menus"
                    :key="index"
                    :href="menu.url"
                >
                    <component
                        class="h-5 w-5"
                        :class="
                            $page.url.split('/').pop() ===
                            getUrlPathName(menu.url).split('/').pop()
                                ? 'text-blue-700'
                                : 'text-gray-500'
                        "
                        :is="icons[menu.icon]"
                    ></component>
                    <span class="text-xs">{{ menu.name }}</span>
                </Link>
            </div>
        </div>
    </nav>
</template>
