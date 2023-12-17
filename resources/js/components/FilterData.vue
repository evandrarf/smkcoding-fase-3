<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import { oneOf } from "vue-types";
import Filter from "@/components/icons/Filter.vue";

const props = defineProps({
    position: oneOf(["bottom", "left", "right", "top"]).def("bottom"),
});
const dropdownOpen = ref(false);
const dropdown = ref(null);
const trigger = ref(null);

const emit = defineEmits(["search"]);

const clickHandler = ({ target }) => {
    if (
        !dropdownOpen.value ||
        dropdown.value.contains(target) ||
        trigger.value.contains(target)
    )
        return;
    dropdownOpen.value = false;
};

onMounted(() => {
    document.addEventListener("click", clickHandler);
});

onUnmounted(() => {
    document.removeEventListener("click", clickHandler);
});
</script>
<template>
    <div class="w-full flex gap-6 justify-between relative">
        <input
            @input="$emit('search', $event.target.value)"
            type="search"
            placeholder="Search ..."
            class="border w-full rounded border-slate-200 outline-none text-sm px-3 py-1"
        />
        <!-- <button
            ref="trigger"
            class="mr-5 border rounded border-slate-200 h-8 w-8"
            @click.prevent="dropdownOpen = !dropdownOpen"
        >
            <Filter class="text-slate-500" />
        </button>
        <transition
            enter-active-class="transition ease-out duration-200 transform"
            enter-from-class="opacity-0 -translate-y-2"
            enter-to-class="opacity-100 translate-y-0"
            leave-active-class="transition ease-out duration-200"
            leave-from-class="opacity-100"
            leave-to-class="opacity-0"
        >
            <div
                v-show="dropdownOpen"
                ref="dropdown"
                :class="{
                    '-bottom-12': position === 'bottom',
                }"
                @focusout="dropdownOpen = false"
                @focusin="dropdownOpen = true"
                class="px-4 text-sm -bottom-12 border border-slate-200 py-2 shadow-xl rounded absolute right-0 z-30 bg-white"
            >
                <slot />
            </div>
        </transition> -->
    </div>
</template>
