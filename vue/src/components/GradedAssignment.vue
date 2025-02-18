<template>
    <div class="min-h-screen bg-white p-6">
      <!-- Assignment Header -->
      <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">Graded Assignment {{ assignmentId }}</h1>
        <div class="flex items-center space-x-4">
          <div class="text-red-500 font-medium">
            Time left: {{ formatTime(timeRemaining) }}
          </div>
          <button 
            @click="submitAssignment"
            class="bg-[#6C63FF] text-white px-6 py-2 rounded-lg hover:bg-[#5B54FF] transition-colors"
          >
            Submit Assignment
          </button>
        </div>
      </div>
  
      <!-- Assignment Content -->
      <div class="space-y-8">
        <!-- Sections -->
        <div class="bg-gray-50 p-4 rounded-lg">
          <h2 class="font-semibold mb-4">SECTIONS</h2>
          <div class="space-y-2">
            <div 
              v-for="section in sections" 
              :key="section.id"
              class="flex items-center space-x-2"
            >
              <input 
                type="checkbox" 
                :id="section.id"
                v-model="section.completed"
                class="rounded text-[#6C63FF] focus:ring-[#6C63FF]"
              >
              <label :for="section.id">{{ section.name }}</label>
            </div>
          </div>
        </div>
  
        <!-- Questions -->
        <div class="space-y-8">
          <div v-for="(question, index) in questions" :key="index" class="bg-white rounded-lg shadow p-6">
            <div class="flex justify-between mb-4">
              <h3 class="text-lg font-medium">Question {{ index + 1 }}</h3>
              <span class="text-[#6C63FF]">{{ question.points }} points</span>
            </div>
            
            <p class="mb-4">{{ question.text }}</p>
  
            <!-- Multiple Choice -->
            <div class="space-y-3">
              <label 
                v-for="option in question.options" 
                :key="option.id"
                class="flex items-center space-x-3 p-3 rounded-lg border hover:bg-gray-50 cursor-pointer"
              >
                <input 
                  type="radio" 
                  :name="`question-${index}`"
                  :value="option.id"
                  v-model="answers[index]"
                  class="text-[#6C63FF] focus:ring-[#6C63FF]"
                >
                <span>{{ option.text }}</span>
              </label>
            </div>
  
            <!-- AI Help -->
            <div class="mt-4 border-t pt-4">
              <div class="flex space-x-2">
                <button 
                  @click="explainQuestion(index)"
                  class="text-[#6C63FF] text-sm hover:underline"
                >
                  Explain this question
                </button>
                <button 
                  @click="provideHint(index)"
                  class="text-[#6C63FF] text-sm hover:underline"
                >
                  Provide a hint
                </button>
                <button 
                  @click="summarizeTopic(index)"
                  class="text-[#6C63FF] text-sm hover:underline"
                >
                  Summarize the topic
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
  
      <!-- Save Progress -->
      <div class="fixed bottom-6 right-6">
        <button 
          @click="saveProgress"
          class="bg-gray-900 text-white px-6 py-2 rounded-lg hover:bg-gray-800 transition-colors"
        >
          Save Progress
        </button>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted, onUnmounted } from 'vue'
  import { useRoute } from 'vue-router'
  
  const route = useRoute()
  const assignmentId = route.params.id
  
  const timeRemaining = ref(60 * 60) // 1 hour in seconds
  const answers = ref([])
  
  const sections = ref([
    { id: 'basics', name: 'Grammar Basics', completed: false },
    { id: 'identification', name: 'Sentence Identification', completed: false },
    { id: 'analysis', name: 'Syntax Analysis', completed: false }
  ])
  
  const questions = ref([
    {
      text: 'Which of the following is a correct implementation of a binary search tree?',
      points: 5,
      options: [
        { id: 'a', text: 'Option A: Implementation with linked nodes' },
        { id: 'b', text: 'Option B: Implementation with arrays' },
        { id: 'c', text: 'Option C: Implementation with hash tables' },
        { id: 'd', text: 'Option D: Implementation with stacks' }
      ]
    },
    // Add more questions as needed
  ])
  
  let timer
  onMounted(() => {
    timer = setInterval(() => {
      if (timeRemaining.value > 0) {
        timeRemaining.value--
      } else {
        submitAssignment()
      }
    }, 1000)
  })
  
  onUnmounted(() => {
    clearInterval(timer)
  })
  
  const formatTime = (seconds) => {
    const minutes = Math.floor(seconds / 60)
    const remainingSeconds = seconds % 60
    return `${minutes}:${remainingSeconds.toString().padStart(2, '0')}`
  }
  
  const saveProgress = () => {
    // Save answers to backend
    console.log('Saving progress:', answers.value)
  }
  
  const submitAssignment = () => {
    // Submit answers to backend
    console.log('Submitting assignment:', answers.value)
  }
  
  const explainQuestion = (index) => {
    console.log('Explaining question:', index + 1)
  }
  
  const provideHint = (index) => {
    console.log('Providing hint for question:', index + 1)
  }
  
  const summarizeTopic = (index) => {
    console.log('Summarizing topic for question:', index + 1)
  }
  </script>