<template>
    <div class="min-h-screen bg-white p-6">
      <!-- Assignment Header -->
      <div class="flex justify-between items-center mb-6">
        <h1 class="text-2xl font-bold">Programming Assignment {{ assignmentId }}</h1>
        <button 
          @click="submitAssignment"
          class="bg-[#6C63FF] text-white px-6 py-2 rounded-lg hover:bg-[#5B54FF] transition-colors"
        >
          Submit Assignment
        </button>
      </div>
  
      <div class="grid grid-cols-2 gap-6">
        <!-- Left Column: Problem Statement & Code Editor -->
        <div class="space-y-6">
          <!-- Problem Statement -->
          <div class="bg-gray-50 rounded-lg p-6">
            <h2 class="text-lg font-semibold mb-4">Problem Statement</h2>
            <div class="prose">
              <p>{{ assignment.description }}</p>
              <h3 class="text-md font-medium mt-4">Input Format:</h3>
              <p>{{ assignment.inputFormat }}</p>
              <h3 class="text-md font-medium mt-4">Output Format:</h3>
              <p>{{ assignment.outputFormat }}</p>
            </div>
          </div>
  
          <!-- Code Editor -->
          <div class="border rounded-lg">
            <div class="bg-gray-100 p-3 flex justify-between items-center">
              <select 
                v-model="selectedLanguage"
                class="bg-white rounded border px-2 py-1"
              >
                <option v-for="lang in languages" :key="lang" :value="lang">
                  {{ lang }}
                </option>
              </select>
              <button 
                @click="runCode"
                class="bg-green-500 text-white px-4 py-1 rounded hover:bg-green-600"
              >
                Run Code
              </button>
            </div>
            <textarea
              v-model="code"
              class="w-full h-96 p-4 font-mono text-sm focus:outline-none"
              placeholder="Write your code here..."
            ></textarea>
          </div>
        </div>
  
        <!-- Right Column: Test Cases & AI Assistant -->
        <div class="space-y-6">
          <!-- Test Cases -->
          <div class="bg-gray-50 rounded-lg p-6">
            <h2 class="text-lg font-semibold mb-4">Test Cases</h2>
            <div class="space-y-4">
              <div v-for="(test, index) in testCases" :key="index" 
                class="border rounded-lg p-4"
                :class="test.passed ? 'border-green-500' : 'border-gray-200'"
              >
                <div class="flex justify-between items-center mb-2">
                  <span class="font-medium">Test Case {{ index + 1 }}</span>
                  <span 
                    class="px-2 py-1 rounded text-sm"
                    :class="test.passed ? 'bg-green-100 text-green-800' : 'bg-gray-100'"
                  >
                    {{ test.passed ? 'Passed' : 'Not Run' }}
                  </span>
                </div>
                <div class="space-y-2">
                  <div>
                    <span class="text-sm text-gray-500">Input:</span>
                    <pre class="bg-gray-100 p-2 rounded mt-1">{{ test.input }}</pre>
                  </div>
                  <div>
                    <span class="text-sm text-gray-500">Expected Output:</span>
                    <pre class="bg-gray-100 p-2 rounded mt-1">{{ test.expectedOutput }}</pre>
                  </div>
                </div>
              </div>
            </div>
          </div>
  
          <!-- AI Assistant -->
          <div class="bg-gray-50 rounded-lg p-6">
            <h2 class="text-lg font-semibold mb-4">AI Chatbot Assistance</h2>
            <div class="space-y-4">
              <div class="h-48 overflow-y-auto border bg-white rounded-lg p-4">
                <div v-for="(message, index) in chatMessages" :key="index"
                  class="mb-2"
                  :class="message.sender === 'user' ? 'text-right' : 'text-left'"
                >
                  <span 
                    class="inline-block rounded-lg px-3 py-1 text-sm"
                    :class="message.sender === 'user' ? 'bg-[#6C63FF] text-white' : 'bg-gray-200'"
                  >
                    {{ message.text }}
                  </span>
                </div>
              </div>
              <div class="flex space-x-2">
                <input 
                  v-model="newMessage"
                  type="text"
                  placeholder="Ask for help..."
                  class="flex-1 rounded-lg border px-3 py-2"
                  @keyup.enter="sendMessage"
                >
                <button 
                  @click="sendMessage"
                  class="bg-[#6C63FF] text-white px-4 py-2 rounded-lg hover:bg-[#5B54FF]"
                >
                  Send
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import { useRoute } from 'vue-router'
  
  const route = useRoute()
  const assignmentId = route.params.id
  
  const selectedLanguage = ref('Python')
  const languages = ['Python', 'Java', 'C++', 'JavaScript']
  const code = ref('')
  const newMessage = ref('')
  
  const assignment = ref({
    description: 'Implement a function that finds the longest common subsequence of two strings.',
    inputFormat: 'Two strings s1 and s2 (1 ≤ |s1|, |s2| ≤ 1000)',
    outputFormat: 'Return the length of the longest common subsequence'
  })
  
  const testCases = ref([
    {
      input: 'ABCDGH\nAEDFHR',
      expectedOutput: '3',
      passed: false
    },
    {
      input: 'AGGTAB\nGXTXAYB',
      expectedOutput: '4',
      passed: false
    }
  ])
  
  const chatMessages = ref([
    { sender: 'assistant', text: 'Need help with the assignment? Feel free to ask!' }
  ])
  
  const runCode = () => {
    // Here you would typically send the code to a backend service
    console.log('Running code:', code.value)
  }
  
  const submitAssignment = () => {
    // Here you would typically submit the assignment
    console.log('Submitting assignment:', code.value)
  }
  
  const sendMessage = () => {
    if (newMessage.value.trim()) {
      chatMessages.value.push({
        sender: 'user',
        text: newMessage.value
      })
      newMessage.value = ''
      // Simulate AI response
      setTimeout(() => {
        chatMessages.value.push({
          sender: 'assistant',
          text: 'I understand your question. Let me help you with that...'
        })
      }, 1000)
    }
  }
  </script>