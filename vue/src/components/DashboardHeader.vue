<template>
<header class="mb-8 flex justify-between items-center">
    <h2 class="text-3xl font-bold text-gray-800">Welcome back, {{ user.name }}!</h2>
    <button @click="logout" class="bg-gradient-to-r from-indigo-500 to-purple-600 text-white px-6 py-2 rounded-full hover:shadow-lg transition-all duration-200 ease-in-out">
    Log Out
    </button>
</header>
</template>

<script setup>
import { useAuthStore } from '../stores/auth'
import { useRouter } from 'vue-router'

const authStore = useAuthStore()
const router = useRouter()

const user = authStore.user

const logout = () => {
authStore.logout()
router.push('/login')
}
</script>