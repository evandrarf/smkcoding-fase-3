<script setup>
import { string, array, object } from "vue-types";
import { Link } from "@inertiajs/inertia-vue3";

import Home from "@/components/icons/Home.vue";
import Plus from "@/components/icons/Plus.vue";
import Bookmark from "@/components/icons/Bookmark.vue";
import User from "@/components/icons/User.vue";
import NewsPaper from "@/components/icons/NewsPaper.vue";
import ChartAnalytics from "@/components/icons/ChartAnalytics.vue";

const props = defineProps({
    appName: string().def("PAPAP PENGUMUMAN DIGITAL SEKOLAH"),
    menus: array().def([]),
    user: object().def(null),
});

const getUrlPathName = (route) => {
    return new URL(route).pathname;
};

const icons = {
    Home,
    Plus,
    Bookmark,
    User,
    NewsPaper,
    ChartAnalytics,
};
</script>
<template>
    <nav
        class="w-full shadow-md sticky top-0 z-20 bg-white py-4 flex justify-center"
    >
        <div class="max-w-[80%] w-full flex justify-between items-center">
            <div class="flex items-center">
                <Link
                    :href="route('app.home')"
                    class="font-semibold text-xl cursor-pointer"
                    >{{ appName }}</Link
                >
            </div>
            <div class="flex gap-4">
                <Link
                    v-if="!user"
                    class="text-white bg-blue-500 px-4 py-2 rounded"
                    :href="route('auth.login.index')"
                    >Login</Link
                >
                <Link
                    class="ml-6 flex gap-1 items-center flex-col"
                    v-for="(menu, index) in menus"
                    :key="index"
                    :href="menu.url"
                >
                    <component
                        class="h-5 w-5"
                        :class="
                            $page.url.split('/').join('') ===
                            getUrlPathName(menu.url).split('/').join('')
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
