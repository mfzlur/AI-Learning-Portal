<script setup>
import DefaultLayout from '../layouts/DefaultLayout.vue'
import InstructorDashboard from '../components/InstructorDashboard.vue'
</script>

<template>
    <DefaultLayout>
        <div class="flex-1 p-1 overflow-y-auto">
            <InstructorDashboard />
        </div>
    </DefaultLayout>
</template>