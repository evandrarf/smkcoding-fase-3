<script>
export default {
    layout: AppLayout,
};
</script>
<script setup>
import { Head } from "@inertiajs/inertia-vue3";
import { ref } from "vue";
import axios from "axios";
import { notify } from "notiwind";

import AppLayout from "@/layouts/AppLayout.vue";
import Upload from "@/components/icons/Upload.vue";
import ImageDragDrop from "@/components/ImageDragDrop.vue";
import Editor from "@/components/Editor.vue";
import VInput from "@/components/Input.vue";

const form = ref({
    image: null,
    content: "",
    title: "",
    priority: "normal",
    published_at: "",
});
const isLoading = ref(false);
const showInputDate = ref(false);
const editorComponent = ref(null);

const handleChangeFileDrop = (files) => {
    form.value.image = files[0];
};

const handleChangeFile = (e) => {
    form.value.image = e.target.files[0];
};

const handleUpload = () => {
    isLoading.value = true;
    const formData = new FormData();
    if (form.value.image !== null) {
        formData.append("file", form.value.image);
    }
    formData.append("content", form.value.content);
    formData.append("title", form.value.title);
    formData.append("priority", form.value.priority);
    formData.append("published_at", form.value.published_at);

    axios
        .post(route("app.madings.store"), formData)
        .then((res) => {
            notify(
                {
                    group: "top",
                    text: res.data.message,
                    type: "success",
                },
                2500
            );
            form.value = {
                image: null,
                content: "",
                title: "",
                priority: "normal",
                published_at: "",
            };
            editorComponent.value.clearContent();
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
        .finally(() => (isLoading.value = false));
};

const handleUpdateContent = (content) => {
    form.value.content = content;
};
</script>
<template>
    <Head title="Home | STEMBA MADING" />
    <div class="flex flex-col w-full">
        <div class="flex justify-between items-center">
            <h1 class="text-4xl font-semibold">Create Mading</h1>
            <div>
                <button
                    class="py-2 px-4 mt-6 w-full text-white rounded"
                    :class="
                        isLoading
                            ? 'bg-gray-400 cursor-not-allowed'
                            : 'bg-blue-500'
                    "
                    @click="handleUpload"
                >
                    {{ isLoading ? "Loading..." : "Create" }}
                </button>
            </div>
        </div>
        <div class="w-1/3 mt-12">
            <VInput
                :model-value="form.title"
                @update:model-value="(newValue) => (form.title = newValue)"
                placeholder="Input title..."
                name="Title"
            />
            <div class="mt-6">
                <label>
                    <p class="text-gray-600 text-sm">Priority</p>
                    <select class="mt-2" v-model="form.priority">
                        <option value="normal">Normal</option>
                        <option value="important">Important</option>
                    </select>
                </label>
            </div>
            <div class="mt-6">
                <div class="flex">
                    <p class="text-gray-600 text-sm">
                        Want to schedule this mading?
                    </p>
                    <input
                        type="checkbox"
                        class="ml-4"
                        v-model="showInputDate"
                    />
                </div>
                <div v-show="showInputDate" class="mt-5">
                    <input type="datetime-local" v-model="form.published_at" />
                </div>
            </div>
        </div>
        <div class="flex flex-col w-full my-16 gap-16">
            <ImageDragDrop @files-dropped="handleChangeFileDrop">
                <label
                    class="w-full border-2 border-blue-400 rounded cursor-pointer flex relative justify-center items-center py-6"
                >
                    <div class="flex items-center gap-4">
                        <Upload class="w-8 h-8 text-blue-700" />
                        <p class="font-lg text-blue-700 font-semibold">
                            Upload Thumbnail
                        </p>
                        <p v-if="form.image">{{ form.image.name }}</p>
                    </div>
                    <input
                        type="file"
                        accept="image/*"
                        class="opacity-0 inset-0 absolute"
                        @change="handleChangeFile"
                    />
                </label>
            </ImageDragDrop>
            <Editor
                ref="editorComponent"
                @update:content="handleUpdateContent"
            />
        </div>
    </div>
</template>
