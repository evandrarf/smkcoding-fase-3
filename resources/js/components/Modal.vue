<script setup>
import { bool } from "vue-types";
import { onMounted, onUnmounted, ref } from "vue";

const props = defineProps({
    showModal: bool().def(false),
});

const modal = ref(null);

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
            <slot />
        </div>
    </transition>
</template>
