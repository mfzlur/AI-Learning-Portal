<!-- src/components/DashboardWidgets.vue -->
<template>
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8 ">
    <!-- Progress Widget -->
    <CourseGrid />

    <!-- Upcoming Deadlines Widget -->
    <div class="bg-white p-6 rounded-xl shadow-md">
    <h3 class="text-xl font-semibold mb-4 text-gray-800">Upcoming Deadlines</h3>
    <ul class="space-y-4">
        <li v-for="deadline in deadlines" :key="deadline.task" class="flex items-center justify-between bg-gray-50 p-3 rounded-lg">
        <span class="flex items-center">
            <Calendar class="w-5 h-5 mr-2 text-indigo-500" />
            {{ deadline.task }}
        </span>
        <span class="text-sm px-2 py-1 bg-indigo-100 text-indigo-700 rounded-full">{{ deadline.date }}</span>
        </li>
    </ul>
    </div>

    <!-- AI Chat Widget -->
    <div class="bg-white p-6 rounded-xl shadow-md lg:col-span-2 order-last lg:order-none">
      <h3 class="text-xl font-semibold mb-4 text-gray-800">AI Study Assistant</h3>
      <div class="h-96">
        <AIChatWindow :messages="chatMessages" @send-message="sendMessage" />
      </div>
    </div>

    <Announcements />
</div>
</template>

<script setup>
import { ref } from 'vue'
import { Calendar } from 'lucide-vue-next'
import CourseGrid from './CourseGrid.vue'
import Announcements from './Announcements.vue'
import AIChatWindow from './AIChatWindow.vue'
const subjects = ref([
{ name: 'BDM', progress: 75 },
{ name: 'DBMS', progress: 60 },
{ name: 'DSA', progress: 85 },
{ name: 'DSA', progress: 85 },
])

const deadlines = ref([
{ task: 'Week 5 GA', date: 'Feb 17' },
{ task: 'Week 6 GA', date: 'Feb 28' },
{ task: 'OPPE1', date: 'Mar 06' },
])

const recentActivities = ref([
'Completed Math Quiz - Score: 95%',
'Submitted CS Assignment',
'Joined Physics study group',
'Watched 2 lecture videos',
])

const chatMessages = ref([
{ sender: 'ai', text: 'Hello! How can I assist you with your studies today?' },
{ sender: 'user', text: 'Can you explain the concept of derivatives in calculus?' },
{ sender: 'ai', text: 'In calculus, a derivative measures the rate of change of a function with respect to one of its variables...' },
])

const newMessage = ref('')

const sendMessage = (message) => {
  chatMessages.value.push({ sender: 'user', text: message })
  // Here you would typically send the message to your AI service and get a response
  // For this example, we'll just simulate a response
  setTimeout(() => {
    chatMessages.value.push({ sender: 'ai', text: 'I understand your question. Let me provide more information about that...' })
  }, 1000)
}
</script>