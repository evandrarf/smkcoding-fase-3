<script setup>
import { QuillEditor } from "@vueup/vue-quill";
import "@vueup/vue-quill/dist/vue-quill.snow.css";
import ImageUploader from "quill-image-uploader";
import axios from "axios";
import { notify } from "notiwind";
import { ref } from "vue";

const emit = defineEmits(["update:content"]);
const editor = ref(null);

const handleChange = () => {
    console.log(editor.value.getHTML());
    emit("update:content", editor.value.getHTML());
};

const clearContent = () => {
    editor.value.setText("");
};

defineExpose({
    clearContent,
});

const modules = {
    name: "imageUploader",
    module: ImageUploader,
    options: {
        upload: (file) => {
            return new Promise((resolve, reject) => {
                const formData = new FormData();
                formData.append("file", file);

                axios
                    .post(route("file.upload"), formData)
                    .then((res) => {
                        resolve(res.data.data.url);
                    })
                    .catch((err) => {
                        reject("Upload failed");
                        notify(
                            {
                                group: "top",
                                text: err.response.data.message,
                                type: "error",
                            },
                            2500
                        );
                    });
            });
        },
    },
};
</script>
<template>
    <div>
        <QuillEditor
            ref="editor"
            @update:content="handleChange"
            toolbar="full"
            theme="snow"
            :modules="modules"
        />
    </div>
</template>
