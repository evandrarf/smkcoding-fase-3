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
    <div class="w-screen min-h-screen">
        <Navbar :app-name="app_name" :menus="menus" />
        <div class="w-full flex justify-center mt-6 z-0">
            <div class="max-w-[80%] w-full h-[5000px]">
                <slot />
            </div>
        </div>
    </div>
</template>
