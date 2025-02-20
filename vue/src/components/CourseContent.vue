<template>
    <div class="bg-white rounded-lg shadow p-6">
      <div class="flex items-center justify-between mb-6">
        <h1 class="text-2xl font-bold">Data Structures</h1>
        <div class="flex items-center space-x-4">
          <select v-model="selectedWeek" class="rounded-md border-gray-300">
            <option value="1">Week 1</option>
            <option value="2">Week 2</option>
            <option value="3">Week 3</option>
            <option value="4">Week 4</option>
          </select>
        </div>
      </div>
  
      <!-- Course Content -->
      <div class="grid grid-cols-3 gap-6">
        <!-- Left Sidebar - Topics -->
        <div class="col-span-1">
          <div class="space-y-4">
            <div v-for="topic in topics" :key="topic.id" class="bg-gray-50 rounded-lg p-4">
              <div class="flex justify-between items-center mb-2">
                <h3 class="font-medium">{{ topic.title }}</h3>
                <span class="text-sm text-gray-500">{{ topic.duration }}</span>
              </div>
              <div class="w-full bg-gray-200 rounded-full h-2">
                <div 
                  class="bg-[#6C63FF] h-2 rounded-full" 
                  :style="{ width: `${topic.progress}%` }"
                ></div>
              </div>
            </div>
          </div>
        </div>
  
        <!-- Main Content - Video Player -->
        <div class="col-span-2">
          <div class="bg-gray-100 rounded-lg aspect-video mb-4 flex items-center justify-center">
            <button class="w-16 h-16 bg-[#6C63FF] rounded-full flex items-center justify-center">
              <span class="text-white text-2xl">▶</span>
            </button>
          </div>
  
          <div class="space-y-4">
            <h2 class="text-xl font-semibold">1.1 Introduction to Arrays</h2>
            <div class="flex space-x-4">
              <button class="text-[#6C63FF] text-sm flex items-center">
                <span class="mr-1">📑</span> Save for later
              </button>
              <button class="text-[#6C63FF] text-sm flex items-center">
                <span class="mr-1">📝</span> Take notes
              </button>
            </div>
          </div>
  
          <!-- Chat Section -->
          <div class="mt-6 border-t pt-4">
            <div class="space-y-4">
              <div class="flex items-start space-x-3">
                <div class="w-8 h-8 bg-[#6C63FF] rounded-full flex items-center justify-center text-white">
                  A
                </div>
                <div class="flex-1">
                  <p class="text-sm text-gray-600">Hi! I'm your AI Agent. Feel free to ask any questions about 1.1 Introduction to Arrays.</p>
                </div>
              </div>
            </div>
            <div class="mt-4 flex space-x-2">
              <input 
                type="text" 
                placeholder="Type your message here..." 
                class="flex-1 rounded-md border-gray-300"
              >
              <button class="bg-[#6C63FF] text-white px-4 py-2 rounded-md">Send</button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const selectedWeek = ref('1')
  const topics = ref([
    {
      id: 1,
      title: '1.1 Introduction to Arrays',
      duration: '15:34',
      progress: 100
    },
    {
      id: 2,
      title: '1.2 Array Operations & Time Complexity',
      duration: '15:21',
      progress: 75
    },
    {
      id: 3,
      title: '1.3 Dynamic Arrays Implementation',
      duration: '18:45',
      progress: 30
    },
    {
      id: 4,
      title: '1.4 Array vs Linked Lists',
      duration: '20:18',
      progress: 0
    }
  ])
  </script>
