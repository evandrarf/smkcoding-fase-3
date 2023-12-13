<script setup>
import { bool } from "vue-types";
import { onMounted, onUnmounted, ref } from "vue";
import XMark from "@/components/icons/XMark.vue";

const props = defineProps({
    showModal: bool().def(false),
    isLoading: bool().def(false),
});

const modal = ref(null);

const emit = defineEmits(["close", "submit", "input"]);

// close if the esc key is pressed
const keyHandler = ({ keyCode }) => {
    if (!props.showModal || keyCode !== 27) return;
    emit("close");
};

onMounted(() => {
    document.addEventListener("keydown", keyHandler);
});

onUnmounted(() => {
    document.removeEventListener("keydown", keyHandler);
});

const handleSubmit = () => {
    emit("submit");
    isLoading.value = true;
};
</script>
<template>
    <transition
        enter-active-class="transition ease-out duration-200 transform"
        enter-from-class="opacity-0 -translate-y-2"
        enter-to-class="opacity-100 translate-y-0"
        leave-active-class="transition ease-out duration-200"
        leave-from-class="opacity-100"
        leave-to-class="opacity-0"
    >
        <div
            v-show="showModal"
            class="absolute w-screen h-screen z-20 inset-0 bg-[rgba(0,0,0,0.2)]"
        ></div>
    </transition>
    <transition
        enter-active-class="transition ease-out duration-200 transform"
        enter-from-class="opacity-0 -translate-y-2"
        enter-to-class="opacity-100 translate-y-0"
        leave-active-class="transition ease-out duration-200"
        leave-from-class="opacity-100"
        leave-to-class="opacity-0"
    >
        <div
            v-show="showModal"
            ref="modal"
            class="absolute flex justify-center items-center inset-0 z-30"
        >
            <div class="w-1/3 h-1/3 bg-white rounded flex flex-col gap-4 p-4">
                <div class="flex justify-between items-center">
                    <h3>Rejection Reason</h3>
                    <XMark class="cursor-pointer" @click="$emit('close')" />
                </div>
                <textarea
                    @input="$emit('input', $event.target.value)"
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
        </div>
    </transition>
</template>
