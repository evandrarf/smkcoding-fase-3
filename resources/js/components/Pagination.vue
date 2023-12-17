<script setup>
import { object } from "vue-types";

const props = defineProps({
    pagination: object().def({}),
});

const emit = defineEmits(["prev", "next"]);

const buttonClass =
    "border border-blue-500 text-blue-500 rounded w-24 py-2 disabled:text-gray-500 disabled:border-gray-400 disabled:cursor-not-allowed";
</script>
<template>
    <div class="flex justify-between items-center">
        <button
            @click="$emit('prev', pagination.current_page - 1)"
            :disabled="pagination.current_page <= 1"
            :class="buttonClass"
        >
            Prev
        </button>
        <div>
            <span
                >{{
                    pagination.current_page * pagination.per_page -
                    (pagination.per_page - pagination.current_page)
                }}
                / {{ pagination.total }} items</span
            >
        </div>
        <button
            @click="$emit('next', pagination.current_page + 1)"
            :disabled="pagination.current_page >= pagination.total_pages"
            :class="buttonClass"
        >
            Next
        </button>
    </div>
</template>
