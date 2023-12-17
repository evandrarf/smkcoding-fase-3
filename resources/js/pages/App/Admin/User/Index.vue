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
import { array } from "vue-types";

import AdminLayout from "@/layouts/AdminLayout.vue";
import DataTable from "@/components/DataTable.vue";
import Spinner from "@/components/icons/Spinner.vue";
import Pagination from "@/components/AdminPagination.vue";
import DropDownEditMenu from "@/components/DropDownEditMenu.vue";
import FilterData from "@/components/FilterData.vue";
import debounce from "@/composable/debounce";
import DeleteModal from "@/components/DeleteModal.vue";
import ModalForm from "./ModalForm.vue";

const props = defineProps({
    roles: array().def([]),
});

const heads = ref(["No", "Name", "Email", "Role", "Action"]);

const isLoading = ref(false);
const data = ref([]);
const pagination = ref({
    count: "",
    current_page: "",
    per_page: "",
    total: 0,
    total_pages: 1,
});
const search = ref("");
const selectedItem = ref({});
const showDeleteModal = ref(false);
const deleteLoading = ref(false);
const showModalForm = ref(false);
const editState = ref(false);

const getData = debounce(async (page = 1) => {
    axios
        .get(route("app.admin.users.get-data"), {
            params: {
                limit: 10,
                page: page,
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

const handleAlertDelete = (item) => {
    showDeleteModal.value = true;
    selectedItem.value = item;
};

const handleEdit = (item) => {
    showModalForm.value = true;
    selectedItem.value = item;
    editState.value = true;
};

const handleCreate = () => {
    showModalForm.value = true;
    editState.value = false;
    selectedItem.value = {};
};

const handleDelete = () => {
    deleteLoading.value = true;
    axios
        .delete(route("app.admin.users.delete", selectedItem.value.id))
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

const handleSuccess = () => {
    showModalForm.value = false;
    isLoading.value = true;
    getData();
};

onMounted(() => {
    isLoading.value = true;
    getData();
});
</script>
<template>
    <Head title="User Management | Admin Stemba Mading" />
    <div class="mb-6 flex justify-between">
        <h1 class="text-2xl font-medium">User Management</h1>
        <div class="flex flex-col gap-3">
            <div class="w-full flex justify-end">
                <button
                    @click="handleCreate"
                    class="px-3 py-2 rounded bg-blue-500 text-white text-xs"
                >
                    Create User
                </button>
            </div>
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
                <p>{{ item.name }}</p>
            </td>
            <td class="px-4 py-3 text-sm">
                <p>{{ item.email }}</p>
            </td>
            <td class="px-4 py-3 text-sm">
                <p>{{ item.role }}</p>
            </td>
            <td class="px-4 whitespace-nowrap text-sm">
                <DropDownEditMenu
                    class="relative inline-flex r-0"
                    :align="'right'"
                    :last="index === data.length - 1 ? true : false"
                >
                    <li
                        class="cursor-pointer hover:bg-slate-100"
                        @click="() => handleEdit(item)"
                    >
                        <div
                            class="flex text-blue-500 items-center space-x-2 p-3"
                        >
                            <span>Edit</span>
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

    <DeleteModal
        @close="() => (showDeleteModal = false)"
        @submit="handleDelete"
        :showModal="showDeleteModal"
        :isLoading="deleteLoading"
    />
    <ModalForm
        @close="() => (showModalForm = false)"
        @success="handleSuccess"
        :showModal="showModalForm"
        :data="selectedItem"
        :editState="editState"
        :roles="roles"
    />
</template>
