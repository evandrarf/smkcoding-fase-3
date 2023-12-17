<script setup>
import { bool } from "vue-types";

import Modal from "@/components/Modal.vue";
import XMark from "@/components/icons/XMark.vue";

const props = defineProps({
    showModal: bool().def(false),
    isLoading: bool().def(false),
});

const handleSubmit = () => {
    emit("submit");
    isLoading.value = true;
};

const emit = defineEmits(["close", "submit"]);
</script>
<template>
    <Modal :showModal="showModal">
        <div class="w-1/3 h-max bg-white rounded flex flex-col gap-8 p-4">
            <div class="flex justify-between items-center">
                <h3 class="text-lg text-red-500">
                    Are You Sure Want To Delete This Data
                </h3>
                <XMark class="cursor-pointer" @click="$emit('close')" />
            </div>
            <div>
                <p class="text-sm">
                    This action cannot be undone. This will permanently delete
                    the data.
                </p>
            </div>
            <div class="flex w-full justify-end">
                <button
                    @click="handleSubmit"
                    :disabled="isLoading"
                    :class="{
                        'bg-slate-300 cursor-not-allowed': isLoading,
                        'bg-red-500': !isLoading,
                    }"
                    class="rounded text-white px-3 py-1"
                >
                    {{ isLoading ? "Loading..." : "Delete" }}
                </button>
            </div>
        </div>
    </Modal>
</template>
