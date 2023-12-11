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

import AuthForm from "@/components/AuthForm.vue";
import VInput from "@/components/Input.vue";

const form = ref({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
});
const isLoading = ref(false);

const register = () => {
    isLoading.value = true;
    axios
        .post(route("auth.register.submit"), form.value)
        .then((res) => {
            Inertia.visit(route("auth.login.index"));
        })
        .catch((err) => {
            console.log(err);
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
            <VInput
                name="Password"
                placeholder="Input your password..."
                type="password"
                :model-value="form.password"
                @update:model-value="(newValue) => (form.password = newValue)"
            />
            <VInput
                name="Password Confirmation"
                placeholder="Input your password confirmation..."
                type="password"
                :model-value="form.password_confirmation"
                @update:model-value="
                    (newValue) => (form.password_confirmation = newValue)
                "
            />
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
