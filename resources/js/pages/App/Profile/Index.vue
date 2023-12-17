<script>
export default {
    layout: AppLayout,
};
</script>
<script setup>
import AppLayout from "@/layouts/AppLayout.vue";
import { ref } from "vue";
import { object, string } from "vue-types";
import axios from "axios";
import { notify } from "notiwind";

import MyMading from "./MyMading.vue";
import MyProfile from "./MyProfile.vue";
import DoorOpen from "@/components/icons/DoorOpen.vue";

const props = defineProps({
    user: object().required,
    role: string().required,
});
const showProfile = ref(true);

const handleLogout = () => {
    axios
        .post(route("auth.logout"))
        .then((res) => {
            window.location.reload();
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
        });
};
</script>
<template>
    <div
        class="bg-white shadow-xl p-6 rounded gap-6 w-full min-h-[12rem] flex flex-col items-center"
    >
        <div class="relative w-full flex justify-center">
            <div
                class="w-48 relative group h-48 rounded-full overflow-hidden bg-gray-100 border border-gray-200"
            >
                <a
                    target="_blank"
                    rel="noopener noreferrer"
                    class="text-xs text-blue-500 absolute inset-0 bg-[rgba(0,0,0,0.2)] items-center justify-center hidden group-hover:flex z-20 text-center"
                    href="https://www.vecteezy.com/free-png/default-profile-picture"
                    >Default Profile Picture PNGs by Vecteezy</a
                >
                <img
                    class="w-full h-full"
                    src="/assets/default-profile.png"
                    alt="Default Profile"
                />
            </div>
            <div class="absolute right-12 top-0 z-10 rounded-full shadow-md">
                <button class="w-16 h-16" @click="handleLogout">
                    <DoorOpen class="w-6 h-6 text-red-500" />
                </button>
            </div>
        </div>
        <div class="w-full justify-center flex">
            <h1 class="text-2xl font-semibold">{{ user?.name }}</h1>
        </div>
        <div class="w-full flex px-8" v-if="role !== 'user'">
            <button
                class="grow border border-gray-200 py-2"
                :class="{
                    'bg-gray-200': showProfile,
                }"
                @click="showProfile = true"
            >
                Profile
            </button>
            <button
                class="grow border border-gray-200 py-2"
                :class="{
                    'bg-gray-200': !showProfile,
                }"
                @click="showProfile = false"
            >
                My Mading
            </button>
        </div>
        <div class="w-full mt-8">
            <MyProfile :data="user" v-if="role === 'user' || showProfile" />
            <MyMading :data="user" v-else />
        </div>
    </div>
</template>
