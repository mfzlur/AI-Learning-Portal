<script setup>
import DefaultLayout from '../layouts/DefaultLayout.vue'
import DeveloperDashboard from '../components/DeveloperDashboard.vue'
</script>

<template>
    <DefaultLayout>
        <div class="flex-1 p-1 overflow-y-auto">
            <DeveloperDashboard />
        </div>
    </DefaultLayout>
</template>