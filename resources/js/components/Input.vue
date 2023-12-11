<script setup>
import { string, bool } from "vue-types";
const props = defineProps({
    type: string().def("text"),
    placeholder: string().def(""),
    name: string().def(""),
    modelValue: string().def(""),
    required: bool().def(false),
});

const emit = defineEmits(["update:modelValue"]);

const updateValue = (e) => {
    emit("update:modelValue", e.target.value);
};
</script>
<template>
    <label class="flex flex-col gap-3 w-full">
        <span class="text-gray-600 text-sm">{{ name }}</span>
        <input
            :type="type"
            :value="modelValue"
            :required="required"
            class="py-2 outline-none bg-inherit border-b-2 border-gray-300"
            :placeholder="placeholder"
            autofocus
            @input="updateValue"
        />
    </label>
</template>
