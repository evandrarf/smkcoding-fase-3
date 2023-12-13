<script setup>
import { ref, onMounted, onUnmounted } from "vue";
import { bool, string } from "vue-types";

const props = defineProps({
    align: string(),
    last: bool().def(false),
});
const dropdownOpen = ref(false);
const trigger = ref(null);
const dropdown = ref(null);

// close on click outside
const clickHandler = ({ target }) => {
    if (
        !dropdownOpen.value ||
        dropdown.value.contains(target) ||
        trigger.value.contains(target)
    )
        return;
    dropdownOpen.value = false;
};

// close if the esc key is pressed
const keyHandler = ({ keyCode }) => {
    if (!dropdownOpen.value || keyCode !== 27) return;
    dropdownOpen.value = false;
};

onMounted(() => {
    document.addEventListener("click", clickHandler);
    document.addEventListener("keydown", keyHandler);
});

onUnmounted(() => {
    document.removeEventListener("click", clickHandler);
    document.removeEventListener("keydown", keyHandler);
});
</script>

<template>
    <div>
        <button
            ref="trigger"
            class="bg-white text-slate-400 hover:text-slate-500 rounded-full"
            :class="{ 'bg-slate-100 text-slate-500': dropdownOpen }"
            aria-haspopup="true"
            @click.prevent="dropdownOpen = !dropdownOpen"
            :aria-expanded="dropdownOpen"
        >
            <span class="sr-only">Menu</span>
            <svg class="w-8 h-8 fill-current" viewBox="0 0 32 32">
                <circle cx="16" cy="16" r="2" />
                <circle cx="10" cy="16" r="2" />
                <circle cx="22" cy="16" r="2" />
            </svg>
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
                class="origin-top-right z-20 absolute bg-white border border-slate-200 rounded shadow-lg overflow-hidden mt-1 mr-2"
                :class="
                    last
                        ? 'right-8 -bottom-4'
                        : align === 'right'
                        ? 'right-2 top-6'
                        : 'left-0 top-6'
                "
            >
                <ul
                    ref="dropdown"
                    @focusin="dropdownOpen = true"
                    @focusout="dropdownOpen = false"
                >
                    <slot />
                </ul>
            </div>
        </transition>
    </div>
</template>
