<script setup>
import { any, string, bool } from "vue-types";
import { ref } from "vue";

import EyeOpen from "@/components/icons/EyeOpen.vue";
import EyeClosed from "@/components/icons/EyeClosed.vue";

const props = defineProps({
    modelValue: any().required,
    name: string().required,
    type: string().required,
    placeholder: string().required,
});

const showPassword = ref(false);
const emit = defineEmits(["update:modelValue"]);
</script>

<template>
    <label>
        <p class="text-sm">{{ name }}</p>
        <div class="w-full flex items-center relative">
            <input
                class="outline-none w-full border text-sm border-gray-200 rounded px-3 py-2 mt-2"
                :placeholder="placeholder"
                :value="modelValue"
                @change="$emit('update:modelValue', $event.target.value)"
                :type="
                    type === 'password' && !showPassword ? 'password' : 'text'
                "
            />
            <EyeOpen
                class="absolute text-xs text-gray-500 top-5 right-3 transform cursor-pointer"
                v-if="showPassword && type === 'password'"
                @click="showPassword = false"
            />
            <EyeClosed
                class="absolute text-xs text-gray-500 top-5 right-3 transform cursor-pointer"
                v-else-if="!showPassword && type === 'password'"
                @click="showPassword = true"
            />
        </div>
    </label>
</template>
