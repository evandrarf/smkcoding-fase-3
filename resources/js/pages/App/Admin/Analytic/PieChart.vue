<script setup>
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from "chart.js";
import { Pie } from "vue-chartjs";
import { object } from "vue-types";
import { watch, ref, computed } from "vue";

const props = defineProps({
    res: object().def([]),
});

const data = computed(() => props.res);

ChartJS.register(ArcElement, Tooltip, Legend);

const options = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
        legend: {
            position: "right",
        },
        tooltip: {
            callbacks: {
                label: function (context) {
                    const value = context.parsed || 0;

                    return `${value} visitors`;
                },
            },
        },
    },
};

const colors = [
    "#5DADE2", // Biru Muda
    "#2ECC71", // Hijau Mint
    "#F4D03F", // Kuning Lemon
    "#E74C3C", // Merah Muda
    "#9B59B6", // Ungu Lavender
    "#F39C12", // Jingga Terang
    "#7F8C8D", // Abu-abu Tua
    "#1ABC9C", // Turkuaz
    "#FF6F61", // Pink Coral
    "#3498DB", // Biru Tua
];
</script>
<template>
    <Pie :options="options" :data="data">Chart</Pie>
</template>
