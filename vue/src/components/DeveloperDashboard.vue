<template>
    <div class="min-h-screen bg-[#F5F5FF] p-6">
    <header class="mb-8 flex justify-between items-center mt-4 ml-4 mr-4">
    <h2 class="text-3xl font-bold text-gray-800">Welcome back, developer!</h2>
</header>
      <!-- Main Content -->
      <div class="bg-white rounded-lg shadow-sm p-6">
        <h1 class="text-2xl font-bold mb-8">Here is your dashboard!</h1>
        
        <div class="space-y-8">
          <h2 class="text-xl font-semibold text-[#6C63FF]">Feedbacks</h2>
          
          <!-- Feedback Items -->
          <div class="space-y-6">
            <div v-for="(feedback, index) in feedbacks" :key="index" class="space-y-3">
              <div class="flex items-baseline space-x-2">
                <span class="text-gray-600">Student {{ feedback.studentId }}:</span>
                <span class="font-medium">{{ feedback.title }}</span>
              </div>
              
              <div class="bg-gray-100 rounded-lg p-4">
                {{ feedback.description }}
              </div>
              
              <button 
                class="bg-gray-600 text-white px-4 py-2 rounded-md hover:bg-[#6C63FF] transition-colors"
              >
                View Attachment
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const feedbacks = ref([
    {
      studentId: 1,
      title: 'Title of Feedback 1',
      description: 'Description of Feedback 1',
      hasAttachment: true
    },
    {
      studentId: 2,
      title: 'Title of Feedback 2',
      description: 'Description of Feedback 2',
      hasAttachment: true
    }
  ])
  </script>