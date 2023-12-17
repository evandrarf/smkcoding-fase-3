<template>
    <div @drop.prevent="onDrop">
        <slot></slot>
    </div>
</template>

<script setup>
import { onMounted, onUnmounted } from "vue";
const emit = defineEmits(["files-dropped"]);

function onDrop(e) {
    emit("files-dropped", [...e.dataTransfer.files]);
}

function preventDefaults(e) {
    e.preventDefault();
}

const events = ["dragenter", "dragover", "dragleave", "drop"];

onMounted(() => {
    events.forEach((eventName) => {
        document.body.addEventListener(eventName, preventDefaults);
    });
});

onUnmounted(() => {
    events.forEach((eventName) => {
        document.body.removeEventListener(eventName, preventDefaults);
    });
});
</script>
