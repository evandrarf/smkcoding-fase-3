<script setup>
import { string, oneOf } from "vue-types";

const props = defineProps({
    text: string().def("normal"),
    color: oneOf(["blue", "red", "green", "yellow"]).def("blue"),
    size: oneOf(["sm", "md", "lg"]).def("md"),
});
</script>
<template>
    <div
        :class="{
            'bg-blue-500': color === 'blue',
            'bg-red-500': color === 'red',
            'bg-green-500': color === 'green',
            'bg-yellow-500': color === 'yellow',
            'px-3 py-0.5 text-xs': size === 'sm',
            'px-4 py-1': size === 'md',
            'px-5 py-2 text-lg': size === 'lg',
        }"
        class="rounded-full w-max text-white text-center"
    >
        <p>{{ text }}</p>
    </div>
</template>
