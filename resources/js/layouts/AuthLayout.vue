<script setup>
import { string } from "vue-types";
const props = defineProps({
    app_name: string().def("PAPAP PENGUMUMAN DIGITAL SEKOLAH"),
});
</script>
<template>
    <div
        class="w-screen overflow-x-hidden h-screen bg-slate-50 flex justify-center"
    >
        <div class="w-1/2 py-16 px-20 gap-16 flex flex-col">
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
