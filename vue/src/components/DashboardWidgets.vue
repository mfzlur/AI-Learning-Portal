<!-- src/components/DashboardWidgets.vue -->
<template>
<div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
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
      <div class="border rounded-lg p-4 h-64 overflow-y-auto mb-4 bg-gray-50">
        <div v-for="(message, index) in chatMessages" :key="index" class="mb-3">
        <div :class="[
            'p-3 rounded-lg max-w-3/4',
            message.sender === 'ai' ? 'bg-indigo-100 text-indigo-800 mr-auto' : 'bg-purple-100 text-purple-800 ml-auto'
        ]">
            {{ message.text }}
        </div>
        </div>
    </div>
    <div class="flex">
        <input
        v-model="newMessage"
        type="text"
        placeholder="Ask anything..."
        class="flex-1 border rounded-l-full px-4 py-2 focus:outline-none focus:ring-2 focus:ring-indigo-500"
        @keyup.enter="sendMessage"
        />
        <button 
        @click="sendMessage"
        class="bg-gradient-to-r from-indigo-500 to-purple-600 text-white px-6 py-2 rounded-r-full hover:shadow-md transition-all duration-200 ease-in-out"
        >
        Send
        </button>
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

const sendMessage = () => {
if (newMessage.value.trim()) {
    chatMessages.value.push({ sender: 'user', text: newMessage.value })
    // Here you would typically send the message to your AI service and get a response
    // For this example, we'll just simulate a response
    setTimeout(() => {
    chatMessages.value.push({ sender: 'ai', text: 'I understand your question. Let me provide more information about that...' })
    }, 1000)
    newMessage.value = ''
}
}
</script>