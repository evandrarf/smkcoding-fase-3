<script setup>
import { string, object, array } from "vue-types";

import Notification from "@/components/Notification.vue";
import Navbar from "@/components/Navbar.vue";

const props = defineProps({
    app_name: string().def("PAPAP PENGUMUMAN DIGITAL SEKOLAH"),
    user: object().def({}),
    menus: array().def([]),
});
</script>
<template>
    <Notification></Notification>
    <div class="max-w-screen overflow-y-auto h-screen">
        <Navbar :app-name="app_name" :menus="menus" :user="user" />
        <div class="w-full h-full flex justify-center mb-32 mt-8 z-0">
            <div class="max-w-[80%] w-full">
                <slot />
            </div>
        </div>
    </div>
</template>
