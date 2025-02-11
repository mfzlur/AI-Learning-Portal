
<script setup>
import DefaultLayout from '../layouts/DefaultLayout.vue'
import DashboardHeader from '../components/DashboardHeader.vue'
import DashboardWidgets from '../components/DashboardWidgets.vue'
</script>

<template>
    <DefaultLayout>
        <div class="flex-1 p-8 overflow-y-auto">
            <DashboardHeader />
            <DashboardWidgets />
        </div>
    </DefaultLayout>
</template>