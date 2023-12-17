<script setup>
import { object } from "vue-types";
import { ref, onMounted } from "vue";
import axios from "axios";
import { notify } from "notiwind";

import InputNormal from "@/components/InputNormal.vue";

const props = defineProps({
    data: object().required,
});

const form = ref({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
});
const isLoading = ref(false);

const handleUpdateProfile = () => {
    isLoading.value = true;
    axios
        .put(route("app.profile.update-data"), form.value)
        .then((res) => {
            notify(
                {
                    group: "top",
                    text: res.data.message,
                    type: "success",
                },
                2500
            );
            form.value.password = "";
            form.value.password_confirmation = "";
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
        })
        .finally(() => {
            isLoading.value = false;
        });
};

onMounted(() => {
    form.value = props.data;
});
</script>
<template>
    <div class="px-8 grid grid-cols-2 gap-4 gap-y-6">
        <InputNormal
            @update:model-value="(val) => (form.name = val)"
            :model-value="form?.name"
            name="Name"
            type="text"
            placeholder="Name"
        />
        <InputNormal
            @update:model-value="(val) => (form.email = val)"
            :model-value="form?.email"
            name="Email"
            type="email"
            placeholder="Email"
        />
        <InputNormal
            @update:model-value="(val) => (form.password = val)"
            :model-value="form?.password"
            name="Password"
            type="password"
            placeholder="Leave blank if you don't want to change your password"
            @changeShowPassword="showPassword = $event"
        />
        <InputNormal
            @update:model-value="(val) => (form.password_confirmation = val)"
            :model-value="form?.password_confirmation"
            name="Password Confirmation"
            type="password"
            placeholder="Leave blank if you don't want to change your password"
            @changeShowPassword="showPasswordConfirmation = $event"
        />
        <div>
            <button
                @click="handleUpdateProfile"
                :class="{
                    'bg-blue-500 cursor-pointer': !isLoading,
                    'bg-gray-300 cursor-not-allowed': isLoading,
                }"
                :disabled="isLoading"
                class="grow border text-white text-sm rounded-sm py-2 px-6"
            >
                {{ isLoading ? "Loading..." : "Update Profile" }}
            </button>
        </div>
    </div>
</template>
