<script setup>
import { ref } from "vue";
import {
    CheckCircleIcon,
    MinusCircleIcon,
    ExclamationCircleIcon,
    XCircleIcon,
} from "@heroicons/vue/24/solid";

const variant = ref({
    success: {
        title: "Success",
        icon: CheckCircleIcon,
        textColor: "text-green-500",
        bgColor: "bg-green-500",
    },
    error: {
        title: "Error",
        icon: XCircleIcon,
        textColor: "text-red-500",
        bgColor: "bg-red-500",
    },
    warning: {
        title: "Warning",
        icon: MinusCircleIcon,
        textColor: "text-orange-500",
        bgColor: "bg-orange-500",
    },
    info: {
        title: "Informasi",
        icon: ExclamationCircleIcon,
        textColor: "text-blue-500",
        bgColor: "bg-blue-500",
    },
});
</script>

<template>
    <NotificationGroup group="top">
        <div
            class="-top-8 z-40 fixed inset-0 flex px-4 py-6 pointer-events-none p-6 items-start justify-end"
        >
            <div class="max-w-sm w-full">
                <Notification v-slot="{ notifications }">
                    <div
                        class="flex max-w-sm w-full mx-auto bg-white shadow-md rounded-lg overflow-hidden mt-4"
                        v-for="notification in notifications"
                        :key="notification.id"
                    >
                        <div
                            class="flex justify-center items-center w-12"
                            :class="variant[notification.type].bgColor"
                        >
                            <Component
                                :is="variant[notification.type].icon"
                                class="h-6 w-6 text-white"
                            ></Component>
                        </div>
                        <div class="-mx-3 py-2 px-4">
                            <div class="mx-3">
                                <span
                                    class="font-semibold"
                                    :class="
                                        variant[notification.type].textColor
                                    "
                                    >{{
                                        variant[notification.type].title
                                    }}</span
                                >
                                <p class="text-gray-600 text-sm">
                                    {{ notification.text }}
                                </p>
                            </div>
                        </div>
                    </div>
                </Notification>
            </div>
        </div>
    </NotificationGroup>
    <NotificationGroup group="mobile">
        <div
            class="z-40 absolute inset-x-0 top-0 flex px-4 py-6 pointer-events-none items-start justify-center"
        >
            <div class="max-w-sm w-full">
                <Notification v-slot="{ notifications }">
                    <div
                        class="flex max-w-sm w-full mx-auto bg-white shadow-md rounded-lg overflow-hidden mt-4"
                        v-for="notification in notifications"
                        :key="notification.id"
                    >
                        <div
                            class="flex justify-center items-center w-12"
                            :class="variant[notification.type].bgColor"
                        >
                            <Component
                                :is="variant[notification.type].icon"
                                class="h-6 w-6 text-white"
                            ></Component>
                        </div>
                        <div class="-mx-3 py-2 px-4">
                            <div class="mx-3">
                                <p class="text-gray-600 text-sm">
                                    {{ notification.text }}
                                </p>
                            </div>
                        </div>
                    </div>
                </Notification>
            </div>
        </div>
    </NotificationGroup>
</template>
