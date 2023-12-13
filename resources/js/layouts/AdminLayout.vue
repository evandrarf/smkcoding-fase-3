<script setup>
import { string, object, array } from "vue-types";
import { Link } from "@inertiajs/inertia-vue3";

import AppLayout from "@/layouts/AppLayout.vue";

const props = defineProps({
    app_name: string().def("PAPAP PENGUMUMAN DIGITAL SEKOLAH"),
    user: object().def({}),
    menus: array().def([]),
    admin_menus: array().def([]),
});

const getUrlPathName = (route) => {
    return new URL(route).pathname;
};
</script>
<template>
    <AppLayout :app_name="app_name" :user="user" :menus="menus">
        <div class="w-full h-min min-h-screen gap-3 flex">
            <main class="w-3/4 h-full shadow-lg p-4">
                <slot />
            </main>
            <div
                class="h-full flex flex-col items-center w-1/4 bg-white shadow-lg"
            >
                <Link
                    v-for="(menu, index) in admin_menus"
                    :key="index"
                    :href="menu.url"
                    :class="
                        $page.url.split('/').pop() ===
                            getUrlPathName(menu.url).split('/').pop() &&
                        'bg-gray-200'
                    "
                    class="text-blue-500 border-2 py-4 text-center px-3 border-gray-200 w-full"
                >
                    {{ menu.name }}
                </Link>
            </div>
        </div>
    </AppLayout>
</template>
