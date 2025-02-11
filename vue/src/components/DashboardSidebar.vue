<template>
<nav :class="[
    'bg-white w-64 p-6 shadow-lg transition-all duration-300 ease-in-out',
    isOpen ? 'translate-x-0' : '-translate-x-full h-screen',
    'fixed md:static md:translate-x-0 h-screen z-30'
  ]">
    <div class="flex items-center mb-8">
    <div class="w-10 h-10 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-lg flex items-center justify-center">
        <GraduationCap class="text-white" />
    </div>
    <h1 class="text-2xl font-bold text-gray-800 ml-3">Seek v2</h1>
    </div>
    <ul class="space-y-4">
    <li v-for="item in navItems" :key="item.name">
        <a
        :href="item.href"
        class="flex items-center p-3 text-gray-600 rounded-lg transition-all duration-200 ease-in-out"
        :class="{ 'bg-gradient-to-r from-indigo-500 to-purple-600 text-white shadow-md': item.current, 'hover:bg-gray-100': !item.current }"
        >
        <component :is="item.icon" class="w-5 h-5 mr-3" />
        {{ item.name }}
        </a>
    </li>
    </ul>
</nav>
</template>
<script setup>
import { ref } from 'vue'
import { LayoutDashboard, FileText, GraduationCap, HelpCircle, BookOpen } from 'lucide-vue-next'

defineProps({
  isOpen: Boolean
})

const navItems = ref([
  { name: 'Dashboard', href: '#', icon: LayoutDashboard, current: true },
  { name: 'My Courses', href: '#', icon: BookOpen, current: false },
  { name: 'Documents', href: '#', icon: FileText, current: false },
  { name: 'Achievements', href: '#', icon: GraduationCap, current: false },
  { name: 'Support', href: '#', icon: HelpCircle, current: false },
])
</script>