
<script setup>
import DefaultLayout from '../layouts/DefaultLayout.vue'
import DashboardWidgets from '../components/DashboardWidgets.vue'

import { useAuthStore } from '../stores/auth'
import { useRouter } from 'vue-router'

const authStore = useAuthStore()
const router = useRouter()

const user = authStore.user
</script>

<template>
    <DefaultLayout>
        <div class="flex-1 p-8 overflow-y-auto">
            <header class="mb-8 flex justify-between items-center">
                <h2 class="text-3xl font-bold text-gray-800">Welcome back, {{ user.name }}!</h2>
            </header>
            <DashboardWidgets />
        </div>
    </DefaultLayout>
</template>