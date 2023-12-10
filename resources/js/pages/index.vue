<script setup>
import { Link } from "@inertiajs/inertia-vue3";
</script>
<template>
    <div>
        <h1 class="text-5xl bg-red-500">Hello World</h1>
    </div>
    <Link :href="route('about')">About</Link>
</template>
