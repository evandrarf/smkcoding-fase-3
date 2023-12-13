<script setup>
import { object } from "vue-types";

const props = defineProps({
    pagination: object(),
});
const emit = defineEmits(["next", "previous"]);
</script>

<template>
    <div
        class="flex flex-col sm:flex-row sm:items-center sm:justify-between"
        v-if="pagination"
    >
        <nav
            class="mb-4 sm:mb-0 sm:order-1"
            role="navigation"
            aria-label="Navigation"
        >
            <ul class="flex justify-center">
                <li class="ml-3 first:ml-0">
                    <button
                        name="previous"
                        class="btn bg-white text-sm border-slate-200"
                        :class="
                            pagination.current_page == 1
                                ? 'cursor-not-allowed text-slate-300'
                                : 'hover:border-slate-300 text-primary cursor-pointer'
                        "
                        @click="
                            pagination.current_page != 1 && $emit('previous')
                        "
                    >
                        &lt;- Previous
                    </button>
                </li>
                <li class="ml-3 first:ml-0">
                    <button
                        name="next"
                        class="btn bg-white text-sm border-slate-200"
                        :class="
                            pagination.current_page == pagination.total_pages
                                ? 'cursor-not-allowed text-slate-300'
                                : 'hover:border-slate-300 text-primary cursor-pointer'
                        "
                        @click="
                            pagination.current_page != pagination.total_pages &&
                                $emit('next')
                        "
                    >
                        Next -&gt;
                    </button>
                </li>
            </ul>
        </nav>
        <div
            class="text-sm text-slate-500 text-center sm:text-left"
            v-if="pagination.total > 0"
            id="label-pagination"
        >
            Showing
            <span class="font-medium text-slate-600">{{
                pagination.current_page == 1
                    ? 1
                    : (pagination.current_page - 1) * pagination.per_page + 1
            }}</span>
            to
            <span class="font-medium text-slate-600">{{
                pagination.current_page == pagination.total_pages
                    ? (pagination.current_page - 1) * pagination.per_page +
                      pagination.count
                    : pagination.current_page * pagination.per_page
            }}</span>
            of
            <span class="font-medium text-slate-600">{{
                pagination.total
            }}</span>
            results
        </div>
        <div
            class="text-sm text-slate-500 text-center sm:text-left"
            v-else
            id="not-found-data"
        >
            Showing <span class="font-medium text-slate-600">0</span> to
            <span class="font-medium text-slate-600">0</span> of
            <span class="font-medium text-slate-600">0</span> results
        </div>
    </div>
</template>
