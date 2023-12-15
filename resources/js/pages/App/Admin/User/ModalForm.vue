<script setup>
import { bool, object, array } from "vue-types";
import { watch, ref } from "vue";
import axios from "axios";
import { notify } from "notiwind";

import Modal from "@/components/Modal.vue";
import XMark from "@/components/icons/XMark.vue";
import InputNormal from "@/components/InputNormal.vue";

const props = defineProps({
    showModal: bool().def(false),
    data: object().def({}),
    editState: bool().def(false),
    roles: array().def([]),
});

const form = ref({
    name: "",
    email: "",
    password: "",
    password_confirmation: "",
    role: "",
});
const isLoading = ref(false);

const createData = () => {
    axios
        .post(route("app.admin.users.store", form.value.id), form.value)
        .then((response) => {
            notify(
                {
                    group: "top",
                    text: response.data.message,
                    type: "success",
                },
                2500
            );

            emit("success");
            form.value = {};
        })
        .catch((error) => {
            console.log(error);
            notify(
                {
                    group: "top",
                    text: error.response.data.message,
                    type: "error",
                },
                2500
            );
        })
        .finally(() => {
            isLoading.value = false;
        });
};

const updateData = () => {
    axios
        .put(route("app.admin.users.update", form.value.id), form.value)
        .then((response) => {
            notify(
                {
                    group: "top",
                    text: response.data.message,
                    type: "success",
                },
                2500
            );

            emit("success");
            form.value = {};
        })
        .catch((error) => {
            console.log(error);
            notify(
                {
                    group: "top",
                    text: error.response.data.message,
                    type: "error",
                },
                2500
            );
        })
        .finally(() => {
            isLoading.value = false;
        });
};

const handleSubmit = () => {
    isLoading.value = true;

    if (!props.editState) {
        createData();
    } else {
        updateData();
    }
};

const emit = defineEmits(["close", "success"]);

watch(
    () => props.data,
    (val) => (form.value = val)
);
</script>
<template>
    <Modal :showModal="showModal">
        <div class="w-1/2 bg-white rounded flex flex-col gap-4 p-4">
            <div class="flex justify-between items-center">
                <h3>{{ editState ? "Edit User" : "Create User" }}</h3>
                <XMark class="cursor-pointer" @click="$emit('close')" />
            </div>
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
            <div class="flex gap-4">
                <InputNormal
                    @update:model-value="(val) => (form.password = val)"
                    :model-value="form?.password"
                    name="Password"
                    type="password"
                    class="grow"
                    placeholder="Leave blank if you don't want to change it"
                />
                <InputNormal
                    class="grow"
                    @update:model-value="
                        (val) => (form.password_confirmation = val)
                    "
                    :model-value="form?.password_confirmation"
                    name="Password confirmation"
                    type="password"
                    placeholder="Leave blank if you don't want to change it"
                />
            </div>
            <div>
                <p class="mb-3">Role</p>
                <label v-for="(index, role) in roles">
                    <div class="flex gap-3">
                        <input
                            type="radio"
                            v-model="form.role"
                            :value="index"
                            :checked="
                                editState ? form.role === role : index === 0
                            "
                        />
                        <span>{{ role }}</span>
                    </div>
                </label>
            </div>
            <div class="flex w-full justify-end">
                <button
                    @click="handleSubmit"
                    :disabled="isLoading"
                    :class="{
                        'bg-slate-300 cursor-not-allowed': isLoading,
                        'bg-blue-500': !isLoading,
                    }"
                    class="rounded text-white px-3 py-1"
                >
                    {{ isLoading ? "Loading..." : "Submit" }}
                </button>
            </div>
        </div>
    </Modal>
</template>
