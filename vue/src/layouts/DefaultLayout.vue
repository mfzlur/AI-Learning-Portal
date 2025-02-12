<!-- src/layouts/DefaultLayout.vue -->
<template>
    <div class="min-h-screen bg-gradient-to-br from-indigo-100 to-purple-100 flex">
      <DashboardSidebar :isOpen="isSidebarOpen" @toggle="toggleSidebar" />
      <div class="flex-1 flex flex-col overflow-y-auto h-screen">
        <div class="p-4 md:hidden">
          <button @click="toggleSidebar" class="text-gray-500 hover:text-gray-700">
            <MenuIcon v-if="!isSidebarOpen" />
            <XIcon v-else />
          </button>
        </div>
        <slot></slot>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import DashboardSidebar from '../components/DashboardSidebar.vue'
  import { MenuIcon, XIcon } from 'lucide-vue-next'
  
  const isSidebarOpen = ref(false)
  
  const toggleSidebar = () => {
    isSidebarOpen.value = !isSidebarOpen.value
  }
  </script>