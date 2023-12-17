<script setup>
import { bool, string } from "vue-types";

import Modal from "@/components/Modal.vue";
import XMark from "@/components/icons/XMark.vue";

const props = defineProps({
    showModal: bool().def(false),
    isLoading: bool().def(false),
    modelValue: string().required,
});

const handleSubmit = () => {
    emit("submit");
    isLoading.value = true;
};

const emit = defineEmits(["close", "submit", "update:modelValue"]);
</script>
<template>
    <Modal :showModal="showModal">
        <div class="w-1/3 h-1/3 bg-white rounded flex flex-col gap-4 p-4">
            <div class="flex justify-between items-center">
                <h3>Rejection Reason</h3>
                <XMark class="cursor-pointer" @click="$emit('close')" />
            </div>
            <textarea
                @input="$emit('update:modelValue', $event.target.value)"
                :value="modelValue"
                class="w-full grow border-2 outline-none p-2 text-sm border-slate-200"
            ></textarea>
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
