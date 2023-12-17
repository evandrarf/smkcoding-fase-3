<script>
export default {
    layout: AdminLayout,
};
</script>
<script setup>
import AdminLayout from "@/Layouts/AdminLayout.vue";
import axios from "axios";
import { ref, onMounted, watch } from "vue";
import { notify } from "notiwind";
import {
    endOfMonth,
    endOfYear,
    startOfMonth,
    startOfYear,
    subMonths,
    startOfWeek,
    endOfWeek,
} from "date-fns";
import dayjs from "dayjs";
import { Head } from "@inertiajs/inertia-vue3";

import PieChart from "./PieChart.vue";
import Spinner from "@/components/icons/Spinner.vue";
import DataTable from "@/components/DataTable.vue";
import Pagination from "@/components/Pagination.vue";
import debounce from "@/composable/debounce";

const dataChart = ref({});
const isLoading = ref(true);
const date = ref([dayjs().toISOString(), dayjs().toISOString()]);
const isEmpty = ref(false);
const isLoadingDownload = ref(false);
const pagination = ref({
    count: "",
    current_page: "",
    per_page: "",
    total: 0,
    total_pages: 1,
});
const data = ref([]);
const heads = ["No", "Title", "Author", "Visitor", ""];

const presetDates = ref([
    { label: "Today", value: [new Date(), new Date()] },
    {
        label: "Today (Slot)",
        value: [new Date(), new Date()],
        slot: "preset-date-range-button",
    },
    {
        label: "This week",
        value: [startOfWeek(new Date()), endOfWeek(new Date())],
    },
    {
        label: "This month",
        value: [startOfMonth(new Date()), endOfMonth(new Date())],
    },
    {
        label: "Last month",
        value: [
            startOfMonth(subMonths(new Date(), 1)),
            endOfMonth(subMonths(new Date(), 1)),
        ],
    },
    {
        label: "This year",
        value: [startOfYear(new Date()), endOfYear(new Date())],
    },
]);

const generateRandomLightColor = () => {
    // Menghasilkan komponen warna RGB secara acak
    const red = Math.floor(Math.random() * 150) + 100; // R dalam kisaran 100-250
    const green = Math.floor(Math.random() * 150) + 100; // G dalam kisaran 100-250
    const blue = Math.floor(Math.random() * 150) + 100; // B dalam kisaran 100-250

    // Mengonversi komponen RGB ke dalam format hex
    const hexColor = `#${red.toString(16)}${green.toString(16)}${blue.toString(
        16
    )}`;

    return hexColor;
};

const getDataChart = () => {
    axios
        .get(
            route("app.admin.analytics.get-mading-visitor-chart", {
                start_date: date.value[0],
                end_date: date.value[1],
            })
        )
        .then((res) => {
            if (res.data.total == 0) {
                isEmpty.value = true;
                dataChart.value = {};
                return;
            }
            const labels = [];
            const datasets = [
                {
                    backgroundColor: [],
                    data: [],
                },
            ];

            res.data.data.forEach((item, index) => {
                labels.push(item.mading_title);
                datasets[0].backgroundColor.push(generateRandomLightColor());
                datasets[0].data.push(item.visitor);
            });

            dataChart.value = {
                labels: labels,
                datasets: datasets,
            };
            isEmpty.value = false;
        })
        .catch((err) => {
            console.log(err);
            notify(
                {
                    group: "top",
                    text: err.response.data.message,
                    type: "error",
                },
                2500
            );
        })
        .finally(() => {
            isLoading.value = false;
        });
};

const getData = debounce(async (page = 1) => {
    axios
        .get(route("app.admin.analytics.get-data"), {
            params: {
                limit: 10,
                page: page,
                start_date: date.value[0],
                end_date: date.value[1],
            },
        })
        .then((response) => {
            data.value = response.data.data;
            pagination.value = response.data.meta.pagination;
        })
        .catch((error) => {
            console.log(error);
            notify(
                {
                    group: "top",
                    text: error.response.data.message,
                    type: "error",
                },
                2500
            );
        })
        .finally(() => {
            isLoading.value = false;
        });
}, 250);

const exportData = () => {
    isLoadingDownload.value = true;
    axios
        .get(route("app.admin.analytics.download-mading-visitor"), {
            responseType: "blob",
            params: {
                start_date: date.value[0],
                end_date: date.value[1],
            },
        })
        .then((res) => {
            const url = window.URL.createObjectURL(new Blob([res.data]));
            const link = document.createElement("a");
            link.href = url;
            link.setAttribute("download", "mading-visitor.xlsx");
            document.body.appendChild(link);
            link.click();
            link.remove();
        })
        .catch((res) => {
            notify(
                {
                    type: "error",
                    group: "top",
                    text: res.response.data.message,
                },
                2500
            );
        })
        .finally(() => {
            isLoadingDownload.value = false;
        });
};

watch(date, (newVal) => {
    isLoading.value = true;
    getDataChart();
    getData();
});

onMounted(() => {
    getDataChart();
    getData();
});
</script>
<template>
    <Head title="Analytics | Admin Stemba Mading" />
    <h1 class="text-2xl font-semibold">Analytics Visitor of Mading</h1>
    <div class="my-8">
        <div class="flex justify-between items-center mb-4">
            <div>
                <button
                    @click="exportData"
                    :disabled="isLoadingDownload"
                    :class="{
                        'bg-blue-600 cursor-pointer': !isLoadingDownload,
                        'bg-gray-400 cursor-not-allowed': isLoadingDownload,
                    }"
                    class="text-sm text-white rounded px-3 py-2"
                >
                    Download
                </button>
            </div>
            <div class="w-1/3">
                <VueDatePicker
                    v-model="date"
                    range
                    :preset-dates="presetDates"
                    :enable-time-picker="false"
                    :clearable="false"
                >
                    <template
                        #preset-date-range-button="{ label, value, presetDate }"
                    >
                        <span
                            role="button"
                            :tabindex="0"
                            @click="presetDate(value)"
                            @keyup.enter.prevent="presetDate(value)"
                            @keyup.space.prevent="presetDate(value)"
                        >
                            {{ label }}
                        </span>
                    </template>
                </VueDatePicker>
            </div>
        </div>
        <div v-if="isLoading" class="mt-8 flex justify-center items-center">
            <Spinner class="w-12 h-12 text-blue-500" />
        </div>

        <div v-else-if="!isEmpty && !isLoading">
            <PieChart :data="dataChart" />
        </div>
        <div v-else class="mt-8">
            <p class="text-center">No data available</p>
        </div>
    </div>
    <div>
        <DataTable :heads="heads">
            <tr v-if="isLoading">
                <td :colspan="heads.length" class="h-56 text-center">
                    <Spinner class="h-6 w-6 text-blue-500" />
                </td>
            </tr>
            <tr v-else-if="data.length === 0 && !isLoading">
                <td :colspan="heads.length" class="h-56">
                    <p class="text-center">No data available</p>
                </td>
            </tr>
            <tr v-else v-for="(item, index) in data" :key="index">
                <td class="px-4 py-3 text-sm">
                    <p>{{ index + 1 }}</p>
                </td>
                <td class="px-4 py-3 text-sm">
                    <p>{{ item.title }}</p>
                </td>
                <td class="px-4 py-3 text-sm">
                    <p>{{ item.author }}</p>
                </td>
                <td class="px-4 py-3 text-sm">
                    <p>{{ item.visitors_count }}</p>
                </td>
                <td class="px-4 whitespace-nowrap text-sm">
                    ({{ item.percentage }}%)
                </td>
            </tr>
        </DataTable>
        <div class="px-4 py-6">
            <Pagination
                :pagination="pagination"
                @next="nextPaginate"
                @previous="previousPaginate"
            />
        </div>
    </div>
</template>
