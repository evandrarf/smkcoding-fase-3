<script>
export default {
    layout: AuthLayout,
};
</script>
<script setup>
import AuthLayout from "@/layouts/AuthLayout.vue";
import { Head, Link } from "@inertiajs/inertia-vue3";
import { ref } from "vue";
import axios from "axios";
import { Inertia } from "@inertiajs/inertia";
import { notify } from "notiwind";

import AuthForm from "@/components/AuthForm.vue";
import VInput from "@/components/Input.vue";

import EyeOpen from "@/components/icons/EyeOpen.vue";
import EyeClosed from "@/components/icons/EyeClosed.vue";

const form = ref({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
});
const isLoading = ref(false);
const showPassword = ref(false);
const showPasswordConfirmation = ref(false);

const register = () => {
    isLoading.value = true;
    axios
        .post(route("auth.register.submit"), form.value)
        .then((res) => {
            notify(
                {
                    group: "top",
                    text: res.data.message,
                    type: "success",
                },
                2500
            );
            Inertia.visit(route("auth.login.index"));
        })
        .catch((err) => {
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
            isLoading.value = false;
        });
};
</script>
<template>
    <Head title="Register | STEMBA MADING" />
    <div class="flex flex-col items-center gap-8 w-full">
        <h1 class="text-4xl font-medium">Register</h1>
        <AuthForm>
            <VInput
                name="Name"
                placeholder="Input your name..."
                type="text"
                :model-value="form.name"
                @update:model-value="(newValue) => (form.name = newValue)"
            />
            <VInput
                name="Email"
                placeholder="Input your email..."
                type="email"
                :model-value="form.email"
                @update:model-value="(newValue) => (form.email = newValue)"
            />
            <div class="w-full flex items-center relative">
                <VInput
                    name="Password"
                    placeholder="Input your password..."
                    :type="showPassword ? 'text' : 'password'"
                    :model-value="form.password"
                    @update:model-value="
                        (newValue) => (form.password = newValue)
                    "
                />
                <div class="absolute right-0 bottom-3 z-10">
                    <EyeClosed
                        class="h-4 w-4 text-gray-400"
                        v-if="showPassword"
                        @click="showPassword = false"
                    />
                    <EyeOpen
                        class="h-4 w-4 text-gray-400"
                        v-if="!showPassword"
                        @click="showPassword = true"
                    />
                </div>
            </div>
            <div class="w-full flex items-center relative">
                <VInput
                    name="Password Confirmation"
                    placeholder="Input your password confirmation..."
                    :type="showPasswordConfirmation ? 'text' : 'password'"
                    :model-value="form.password_confirmation"
                    @update:model-value="
                        (newValue) => (form.password_confirmation = newValue)
                    "
                />
                <div class="absolute right-0 bottom-3 z-10">
                    <EyeClosed
                        class="h-4 w-4 text-gray-400"
                        v-if="showPasswordConfirmation"
                        @click="showPasswordConfirmation = false"
                    />
                    <EyeOpen
                        class="h-4 w-4 text-gray-400"
                        v-if="!showPasswordConfirmation"
                        @click="showPasswordConfirmation = true"
                    />
                </div>
            </div>
            <button
                class="py-2 px-4 mt-6 w-full text-white rounded"
                :class="
                    isLoading ? 'bg-gray-400 cursor-not-allowed' : 'bg-blue-500'
                "
                @click="register"
            >
                {{ isLoading ? "Loading..." : "Register" }}
            </button>
        </AuthForm>
        <p>
            Already have an account?
            <Link class="text-blue-500" :href="route('auth.login.index')"
                >Login</Link
            >
        </p>
    </div>
</template>
