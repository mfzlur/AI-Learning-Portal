<template>
    <div class="max-w-6xl mx-auto bg-white rounded-lg shadow p-6 mt-18 h-[700px]">
      <h1 class="text-2xl font-bold text-center mb-8">FEEDBACK FORM</h1>
  
      <form @submit.prevent="submitFeedback" class="space-y-6">
        <!-- Title -->
        <div>
          <label for="title" class="block text-sm font-medium text-gray-700">Title</label>
          <input
            id="title"
            v-model="feedback.title"
            type="text"
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#6C63FF] focus:ring-[#6C63FF]"
            required
          />
        </div>
  
        <!-- Description -->
        <div>
          <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
          <textarea
            id="description"
            v-model="feedback.description"
            rows="6"
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-[#6C63FF] focus:ring-[#6C63FF]"
            required
          ></textarea>
        </div>
  
        <!-- Attachments -->
        <div>
          <label class="block text-sm font-medium text-gray-700 mb-2">Attach Attachments</label>
          <div class="grid grid-cols-3 gap-4">
            <div v-for="n in 3" :key="n" class="relative">
              <div class="border-2 border-dashed border-gray-300 rounded-lg p-4 text-center cursor-pointer hover:border-[#6C63FF]">
                <input
                  type="file"
                  class="absolute inset-0 w-full h-full opacity-0 cursor-pointer"
                  @change="handleFileUpload($event, n-1)"
                />
                <svg class="mx-auto h-8 w-8 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                  <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 16v1a3 3 0 003 3h10a3 3 0 003-3v-1m-4-8l-4-4m0 0L8 8m4-4v12" />
                </svg>
              </div>
            </div>
          </div>
        </div>
  
        <!-- Submit Button -->
        <div class="flex justify-end">
          <button
            type="submit"
            class="bg-[#6C63FF] text-white px-6 py-2 rounded-md hover:bg-[#5B54FF] transition-colors"
          >
            SUBMIT FORM
          </button>
        </div>
      </form>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const feedback = ref({
    title: '',
    description: '',
    attachments: []
  })
  
  const handleFileUpload = (event, index) => {
    const file = event.target.files[0]
    if (file) {
      feedback.value.attachments[index] = file
    }
  }
  
  const submitFeedback = () => {
    // Handle form submission
    console.log('Submitting feedback:', feedback.value)
  }
  </script>