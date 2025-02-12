<!-- src/components/AIChatWindow.vue -->
<template>
    <div class="flex flex-col h-full bg-gradient-to-br from-indigo-50 to-purple-50 rounded-lg shadow-inner">
      <!-- Chat Messages -->
      <div class="flex-grow overflow-y-auto p-6 space-y-4">
        <div v-for="(message, index) in messages" :key="index" 
             :class="[
               'max-w-3/4 p-4 rounded-2xl shadow-md w-fit',
               message.sender === 'ai' ? 'bg-white text-gray-800 mr-auto' : 'bg-gradient-to-r from-indigo-500 to-purple-600 text-white ml-auto'
             ]">
          <p class="text-sm" v-html="message.text"></p>
        </div>
      </div>
  
      <!-- Chat Input Box -->
      <div class="p-4 bg-white rounded-b-lg">
        <div class="flex items-end bg-gray-100 rounded-2xl shadow-inner p-3">
          <!-- Expanding Textarea -->
          <textarea
            ref="textareaRef"
            v-model="newMessage"
            placeholder="Ask anything..."
            rows="1"
            class="flex-1 bg-transparent px-4 py-2 resize-none focus:outline-none overflow-y-auto max-h-[150px]"
            @input="adjustHeight"
            @keydown.enter.shift.exact = ""
            @keyup.enter.exact="sendMessage"
            
          ></textarea>
  
          <!-- Attachment Icon -->
          <label for="file-upload" class="cursor-pointer p-3">
            <PaperclipIcon class="w-5 h-5 text-gray-500 hover:text-indigo-500" />
          </label>
          <input id="file-upload" type="file" class="hidden" @change="handleFileUpload" accept="image/*,.pdf" />
  
          <!-- Send Button -->
          <button 
            @click="sendMessage"
            class="bg-gradient-to-r from-indigo-500 to-purple-600 text-white p-3 rounded-full hover:shadow-lg transition-all duration-200 ease-in-out"
          >
            <SendIcon class="w-5 h-5" />
          </button>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, nextTick } from 'vue'
  import { SendIcon, PaperclipIcon } from 'lucide-vue-next'
  
  const props = defineProps({
    messages: {
      type: Array,
      default: () => []
    }
  })
  
  const emit = defineEmits(['send-message'])
  const newMessage = ref('')
  const textareaRef = ref(null)
  
  // Function to auto-grow the textarea
  const adjustHeight = () => {
    nextTick(() => {
      if (textareaRef.value) {
        textareaRef.value.style.height = 'auto' // Reset height
        textareaRef.value.style.height = `${textareaRef.value.scrollHeight}px` // Adjust to content
      }
    })
  }
  
  // Send Message
  const sendMessage = () => {
    if (newMessage.value.trim()) {
      emit('send-message', newMessage.value.replace(/\n/g, '<br>'))
      newMessage.value = ''
      adjustHeight() // Reset height after sending
    }
  }
  </script>
  