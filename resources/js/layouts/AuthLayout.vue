<script setup>
import { string } from "vue-types";
import Notification from "@/components/Notification.vue";
const props = defineProps({
    app_name: string().def("PAPAP PENGUMUMAN DIGITAL SEKOLAH"),
});
</script>
<template>
    <Notification></Notification>
    <div
        class="w-screen overflow-x-hidden h-screen bg-slate-50 flex justify-center overflow-y-hidden"
    >
        <div class="w-1/2 py-16 px-20 gap-16 flex flex-col overflow-y-auto">
            <h2 class="font-bold text-xl">{{ app_name }}</h2>
            <slot />
        </div>
        <div class="w-1/2 bg-gray-300">
            <img
                src="/assets/login.png"
                class="w-full object-cover"
                alt="Login Illustration"
            />
        </div>
    </div>
</template>
