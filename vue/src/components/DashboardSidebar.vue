<template>
  <nav :class="[
      'bg-white w-64 p-6 shadow-lg transition-all duration-300 ease-in-out',
      isOpen ? 'translate-x-0' : '-translate-x-full h-screen',
      'fixed md:static md:translate-x-0 h-screen z-30'
    ]">
    <div class="flex items-center justify-between mb-8">
      <div class="flex items-center">
        <div class="w-10 h-10 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-lg flex items-center justify-center">
          <GraduationCap class="text-white" />
        </div>
        <h1 class="text-2xl font-bold text-gray-800 ml-3">Seek v2</h1>
      </div>
      <button @click="$emit('toggle')" class="md:hidden text-gray-500 hover:text-gray-700">
        <XIcon />
      </button>
    </div>

    <ul class="space-y-4 flex-grow">
      <li v-for="item in navItems" :key="item.name">
        <router-link
          :to="item.href"
          class="flex items-center p-3 text-gray-600 rounded-lg transition-all duration-200 ease-in-out"
          :class="{
            'bg-gradient-to-r from-indigo-500 to-purple-600 text-white shadow-md': isActive(item),
            'hover:bg-gray-100': !isActive(item)
          }"
        >
          <component :is="item.icon" class="w-5 h-5 mr-3" />
          {{ item.name }}
        </router-link>
      </li>
      <li>
        <button @click="logout" class="w-full flex items-center p-3 text-gray-600 rounded-lg transition-all duration-200 ease-in-out hover:bg-gray-100">
          <LogOut class="w-5 h-5 mr-3" />
          Log Out
        </button>
      </li>
    </ul>
  </nav>
</template>

<script setup>
import { ref } from 'vue'
import { useRouter, useRoute } from 'vue-router'  // Import useRouter and useRoute
import { useAuthStore } from '../stores/auth'
import { User, LayoutDashboard, FileText, GraduationCap, HelpCircle, BookOpen, MessageSquare, XIcon, LogOut } from 'lucide-vue-next'

const props = defineProps({
  isOpen: Boolean
})

const emit = defineEmits(['toggle'])

const router = useRouter()
const route = useRoute()  // To track the current route
const authStore = useAuthStore()

// Navigation items
const navItems = ref([
  { name: 'My Profile', href: '/profile', icon: User },
  { name: 'Dashboard', href: '/dashboard', icon: LayoutDashboard },
  { name: 'My Courses', href: '/my-courses', icon: BookOpen },
  { name: 'Feedback', href: '/feedback', icon: FileText },
  { name: 'AI Assistant', href: '/ai-assistant', icon: MessageSquare },
])

// Function to check if the item is the current route
const isActive = (item) => {
  return route.path === item.href
}

const logout = () => {
  authStore.logout()
  router.push('/login')
}
</script>
