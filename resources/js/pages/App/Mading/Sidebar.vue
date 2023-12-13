<script setup>
import { ref } from "vue";
import { object } from "vue-types";

import Pagination from "@/components/Pagination.vue";

const props = defineProps({
    pagination: object().def({}),
});

const filter = ref({
    priority: "",
});
const prioritySelect = ref(null);

const emit = defineEmits(["prev", "next", "search", "filter"]);

const handleClearFilter = () => {
    filter.value.priority = "";
    prioritySelect.value.value = "";
    emit("filter", filter.value);
};
</script>
<template>
    <div class="w-1/3 h-full px-3">
        <div class="flex w-full">
            <input
                @input="$emit('search', $event.target.value)"
                type="search"
                class="outline-none w-full border-2 border-gray-300 px-3 py-1 rounded"
                placeholder="Search mading"
            />
        </div>
        <div class="w-full my-6">
            <h3>Filter:</h3>
            <div class="flex mt-3">
                <label>
                    <p class="text-sm">Priority</p>
                    <select
                        v-model="filter.priority"
                        ref="prioritySelect"
                        class="border mt-3"
                    >
                        <option value="" selected>All</option>
                        <option value="important">Important</option>
                        <option value="normal">Normal</option>
                    </select>
                </label>
            </div>
            <div class="flex gap-6 items-center mt-6">
                <button
                    @click="$emit('filter', filter)"
                    class="bg-blue-500 text-white px-3 py-1 rounded"
                >
                    Filter
                </button>
                <button
                    class="bg-gray-500 text-white px-3 py-1 rounded"
                    @click="handleClearFilter"
                >
                    Clear
                </button>
            </div>
        </div>
        <Pagination
            class="mt-8"
            @next="(data) => $emit('next', data)"
            @prev="(data) => $emit('prev', data)"
            :pagination="pagination"
        />
    </div>
</template>
