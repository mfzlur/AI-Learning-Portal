<template>
    <div class="flex h-screen bg-gray-100 mt-5">
      <!-- Sidebar -->
      <div class="w-64 bg-white shadow-md flex flex-col">
        <!-- New Chat Button -->
        <div class="p-4">
          <button 
            @click="startNewChat"
            class="w-full bg-[#6C63FF] text-white rounded-lg py-2 px-4 flex items-center justify-center gap-2 hover:bg-[#5B54FF] transition-colors"
          >
            <Plus class="w-4 h-4" />
            New Chat
          </button>
        </div>
  
        <!-- Subject Navigation -->
        <div class="p-4">
          <h2 class="text-xl font-bold text-[#6C63FF] mb-4">AI Study Assistant</h2>
        </div>
  
        <!-- Chat History -->
        <div class="flex-1 overflow-y-auto">
          <nav class="space-y-1">
            <a 
              v-for="chat in chatHistory" 
              :key="chat.id" 
              href="#" 
              class="block px-4 py-2 text-gray-600 hover:bg-gray-100 flex items-center gap-2"
              :class="{ 'bg-gray-100': chat.id === currentChat }"
              @click="selectChat(chat.id)"
            >
              <MessageSquare class="w-4 h-4" />
              <span class="truncate">{{ chat.title }}</span>
            </a>
          </nav>
        </div>
      </div>
  
      <!-- Chat Area -->
      <div class="flex-1 flex flex-col">
        <!-- Chat Header -->
        <div class="bg-white shadow-sm p-4 flex justify-between items-center">
          <h3 class="text-lg font-semibold">{{ getCurrentChat?.title || 'AI Chat Assistant' }}</h3>
          <button 
            @click="clearChat"
            class="text-[#6C63FF] hover:text-[#5B54FF] transition-colors"
          >
            Clear Chat
          </button>
        </div>
  
        <!-- Messages -->
        <div class="flex-1 overflow-y-auto p-4 space-y-4">
          <div v-for="(message, index) in messages" 
            :key="index" 
            class="flex"
            :class="message.sender === 'user' ? 'justify-end' : 'justify-start'"
          >
            <div 
              class="max-w-xs lg:max-w-md xl:max-w-lg px-4 py-2 rounded-lg" 
              :class="message.sender === 'user' ? 'bg-[#6C63FF] text-white' : 'bg-gray-200 text-gray-800'"
            >
              {{ message.content }}
            </div>
          </div>
        </div>
  
        <!-- Input Area -->
        <div class="bg-white p-4">
          <div class="flex space-x-2">
            <input 
              v-model="newMessage"
              type="text" 
              placeholder="Type your message here..." 
              class="flex-1 border rounded-full px-4 py-2 focus:outline-none focus:ring-2 focus:ring-[#6C63FF]"
              @keyup.enter="sendMessage"
            >
            <button 
              @click="sendMessage"
              class="bg-[#6C63FF] text-white rounded-full px-6 py-2 hover:bg-[#5B54FF] transition-colors"
            >
              Send
            </button>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, computed } from 'vue'
  import { MessageSquare, Plus } from 'lucide-vue-next'
  
  const currentChat = ref(null)
  const newMessage = ref('')
  
  const chatHistory = ref([
    { id: 1, title: 'Data Structures Help' },
    { id: 2, title: 'Algorithm Analysis' },
    { id: 3, title: 'Programming Questions' }
  ])
  
  const messages = ref([
    { sender: 'assistant', content: 'Hello! How can I assist you with your studies today?' },
    { sender: 'user', content: 'Can you explain the concept of binary trees?' },
    { sender: 'assistant', content: 'A binary tree is a tree data structure in which each node has at most two children, referred to as the left child and the right child...' }
  ])
  
  const getCurrentChat = computed(() => {
    return chatHistory.value.find(chat => chat.id === currentChat.value)
  })
  
  const selectChat = (chatId) => {
    currentChat.value = chatId
    // Here you would typically load the chat history for the selected chat
  }
  
  const startNewChat = () => {
    currentChat.value = null
    messages.value = [{
      sender: 'assistant',
      content: 'Hello! How can I assist you with your studies today?'
    }]
  }
  
  const clearChat = () => {
    messages.value = [{
      sender: 'assistant',
      content: 'Chat cleared. How can I help you?'
    }]
  }
  
  const sendMessage = () => {
    if (newMessage.value.trim()) {
      messages.value.push({
        sender: 'user',
        content: newMessage.value
      })
      newMessage.value = ''
      // Simulate AI response
      setTimeout(() => {
        messages.value.push({
          sender: 'assistant',
          content: 'I understand your question. Let me help you with that...'
        })
      }, 1000)
    }
  }
  </script>