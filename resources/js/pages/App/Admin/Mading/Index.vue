<script>
export default {
    layout: AdminLayout,
};
</script>
<script setup>
import { Head } from "@inertiajs/inertia-vue3";
import { ref, onMounted } from "vue";
import axios from "axios";
import { notify } from "notiwind";
import { Inertia } from "@inertiajs/inertia";

import AdminLayout from "@/layouts/AdminLayout.vue";
import DataTable from "@/components/DataTable.vue";
import Spinner from "@/components/icons/Spinner.vue";
import Pagination from "@/components/AdminPagination.vue";
import DropDownEditMenu from "@/components/DropDownEditMenu.vue";
import FilterData from "@/components/FilterData.vue";
import debounce from "@/composable/debounce";
import RejectModal from "./RejectModal.vue";
import DeleteModal from "@/components/DeleteModal.vue";

const heads = ref(["No", "Title", "Author", "Published At", "Action"]);

const isLoading = ref(false);
const data = ref([]);
const pagination = ref({
    count: "",
    current_page: "",
    per_page: "",
    total: 0,
    total_pages: 1,
});
const statusFilter = ref("published");
const search = ref("");
const rejectionReason = ref("");
const showRejectModal = ref(false);
const selectedItem = ref({});
const rejectLoading = ref(false);
const showDeleteModal = ref(false);
const deleteLoading = ref(false);

const getData = debounce(async (page = 1) => {
    axios
        .get(route("app.madings.get-data"), {
            params: {
                limit: 10,
                page: page,
                status: statusFilter.value,
                search: search.value,
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

const nextPaginate = (page) => {
    pagination.value.current_page += 1;
    isLoading.value = true;
    getData(pagination.value.current_page);
};

const handleSearch = (value) => {
    search.value = value;
    isLoading.value = true;
    getData();
};

const previousPaginate = () => {
    pagination.value.current_page -= 1;
    isLoading.value = true;
    getData(pagination.value.current_page);
};

const handleDetail = (item) => {
    Inertia.visit(route("app.madings.detail", item.slug));
};

const classList =
    "border cursor-pointer py-1 px-2 justify-center text-blue-400 items-center flex border-gray-200 w-full h-full";
const status = ["Published", "Rejected", "Draft", "Need Review"];

const handleChangeStatus = ({ target }) => {
    isLoading.value = true;
    statusFilter.value = target.innerText.toLowerCase().split(" ").join("_");
    if (statusFilter.value === "rejected") {
        heads.value = ["No", "Title", "Author", "Reason", "Action"];
    } else {
        heads.value = ["No", "Title", "Author", "Published At", "Action"];
    }
    getData();
};

const handlePostChangeStatus = (status, item) => {
    rejectLoading.value = true;
    axios
        .post(route("app.madings.change-status", item.id), {
            status: status,
            rejection_reason: rejectionReason.value,
        })
        .then((response) => {
            notify(
                {
                    group: "top",
                    text: response.data.message,
                    type: "success",
                },
                2500
            );
            rejectionReason.value = "";
            showRejectModal.value = false;
            selectedItem.value = {};
            isLoading.value = true;
            getData();
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
            rejectLoading.value = false;
        });
};

const handleChangeRejectionReason = (value) => {
    rejectionReason.value = value;
};

const handleAlertDelete = (item) => {
    showDeleteModal.value = true;
    selectedItem.value = item;
};

const handleDelete = () => {
    deleteLoading.value = true;
    axios
        .delete(route("app.madings.delete", selectedItem.value.id))
        .then((response) => {
            notify(
                {
                    group: "top",
                    text: response.data.message,
                    type: "success",
                },
                2500
            );
            showDeleteModal.value = false;
            isLoading.value = true;
            getData();
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
            deleteLoading.value = false;
        });
};

const handleReject = (item) => {
    showRejectModal.value = true;
    selectedItem.value = item;
};

onMounted(() => {
    isLoading.value = true;
    getData();
});
</script>
<template>
    <Head title="Mading Management | Admin Stemba Mading" />
    <div class="mb-6 flex justify-between">
        <h1 class="text-2xl font-medium">Mading</h1>
        <div class="flex flex-col gap-3">
            <nav class="grid grid-cols-4 text-center items-center text-sm">
                <div
                    @click="handleChangeStatus"
                    :class="[
                        classList,
                        statusFilter ===
                            item.toLowerCase().split(' ').join('_') &&
                            'bg-gray-200',
                    ]"
                    v-for="(item, index) in status"
                    :key="index"
                >
                    <p>{{ item }}</p>
                </div>
            </nav>
            <FilterData @search="handleSearch">
                <input type="text" />
            </FilterData>
        </div>
    </div>
    <!-- <div class="overflow-y-visible no-scrollbar"> -->
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
            <td class="px-4 py-3 text-sm" v-if="statusFilter === 'rejected'">
                <p>{{ item.rejection_reason }}</p>
            </td>
            <td class="px-4 py-3 text-sm" v-else>
                <p>{{ item.published_at }}, {{ item.published_at_time }}</p>
            </td>
            <td class="px-4 whitespace-nowrap text-sm">
                <DropDownEditMenu
                    class="relative inline-flex r-0"
                    :align="'right'"
                    :last="index === data.length - 1 ? true : false"
                >
                    <li
                        class="cursor-pointer hover:bg-slate-100"
                        @click="() => handleDetail(item)"
                    >
                        <div
                            class="flex text-blue-500 items-center space-x-2 p-3"
                        >
                            <span>Detail</span>
                        </div>
                    </li>
                    <li
                        v-if="statusFilter === 'need_review'"
                        class="cursor-pointer hover:bg-slate-100"
                        @click="() => handlePostChangeStatus('approve', item)"
                    >
                        <div
                            class="flex text-green-500 items-center space-x-2 p-3"
                        >
                            <span>Approve</span>
                        </div>
                    </li>
                    <li
                        v-if="statusFilter === 'need_review'"
                        class="cursor-pointer hover:bg-slate-100"
                        @click="() => handleReject(item)"
                    >
                        <div
                            class="flex text-red-500 items-center space-x-2 p-3"
                        >
                            <span>Reject</span>
                        </div>
                    </li>
                    <li
                        class="cursor-pointer hover:bg-slate-100"
                        @click="() => handleAlertDelete(item)"
                    >
                        <div
                            class="flex justify-between text-red-500 items-center space-x-2 p-3"
                        >
                            <span>Delete</span>
                        </div>
                    </li>
                </DropDownEditMenu>
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
    <RejectModal
        :isLoading="rejectLoading"
        @close="() => (showRejectModal = false)"
        @submit="() => handlePostChangeStatus('reject', selectedItem)"
        @update:modelValue="handleChangeRejectionReason"
        :modelValue="rejectionReason"
        :showModal="showRejectModal"
    />
    <DeleteModal
        @close="() => (showDeleteModal = false)"
        @submit="handleDelete"
        :showModal="showDeleteModal"
        :isLoading="deleteLoading"
    />
</template>
