<template>
  <div><header class="mb-8 flex justify-between items-center mt-4 ml-4 mr-4">
    <h2 class="text-3xl font-bold text-gray-800">Select your courses.</h2>
</header>
    <div class="bg-white rounded-lg shadow p-6">
  
      <div class="grid grid-cols-2 gap-8">
        <!-- Subject Selection -->
        <div class="bg-gray-50 rounded-lg p-6">
          <h2 class="text-xl font-semibold mb-6">Subjects</h2>
          <div class="space-y-4">
            <div v-for="(subject, index) in subjects" :key="index" 
              class="flex items-center justify-between p-3 bg-white rounded-lg shadow-sm">
              <span class="text-gray-900">{{ subject }}</span>
              <button class="px-4 py-1 bg-gray-200 rounded-md hover:bg-[#6C63FF] hover:text-white transition-colors">
                select
              </button>
            </div>
          </div>
        </div>
  
        <!-- Suggestions -->
        <div class="space-y-6">
          <button class="w-full p-3 bg-[#F5F5FF] text-[#6C5CE7] rounded-lg hover:bg-[#6C5CE7] hover:text-white transition-colors">
  <h2 class="text-xl font-semibold mb-4">Help me choose courses</h2>
  <p>Get personalized course recommendations based on your interests and goals.</p>
</button>

          <div class="bg-gray-50 rounded-lg p-6">
            <h2 class="text-xl font-semibold mb-4">Suggested Subjects based on preference</h2>
            <div class="space-y-3">
              <div v-for="(subject, index) in suggestedSubjects" :key="index"
                class="p-3 bg-white rounded-lg shadow-sm">
                {{ subject }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div></div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const subjects = ref([
    'subject 1',
    'subject 2',
    'subject 3',
    'subject 4',
    'subject 5',
    'subject 6'
  ])
  
  const suggestedSubjects = ref([
    'subject 1',
    'subject 2',
    'subject 3',
    'subject 4'
  ])
  </script>
