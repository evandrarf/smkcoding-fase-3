<script>
export default {
    layout: AuthLayout,
};
</script>
<script setup>
import { ref } from "vue";
import axios from "axios";

import AuthLayout from "@/layouts/AuthLayout.vue";
import AuthForm from "@/components/AuthForm.vue";
import { Head } from "@inertiajs/inertia-vue3";
import VInput from "@/components/Input.vue";

const form = ref({
    email: "",
    password: "",
});

const login = () => {
    console.log(form.value);
    axios
        .post(route("auth.login.submit"), form.value)
        .then((res) => {
            window.location.reload();
        })
        .catch((err) => {
            console.log(err);
        });
};
</script>

<template>
    <Head title="Login | STEMBA MADING" />
    <div class="flex flex-col items-center gap-8 w-full">
        <h1 class="text-4xl font-medium">Login</h1>
        <AuthForm>
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
            <button
                class="py-2 px-4 bg-blue-500 mt-6 w-full text-white rounded"
                @click="login"
            >
                Login
            </button>
        </AuthForm>
    </div>
</template>
