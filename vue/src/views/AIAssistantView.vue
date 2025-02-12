<!-- src/views/AIAssistantView.vue -->
<template>
  <div class="flex h-screen bg-gradient-to-br from-indigo-100 to-purple-100">
    <!-- Sidebar -->
    <div class="w-64 bg-white shadow-lg p-6 flex flex-col">
      <button @click="$router.push('/dashboard')" class="mb-6 text-indigo-600 hover:text-indigo-800 flex items-center">
        <ArrowLeftIcon class="w-5 h-5 mr-2" />
        Back to Dashboard
      </button>
      <h2 class="text-xl font-bold mb-4 text-gray-800">Chat History</h2>
      <ul class="space-y-2 flex-grow overflow-y-auto">
        <li v-for="chat in chatHistory" :key="chat.id" 
              class="cursor-pointer p-3 rounded-lg transition-all duration-200 ease-in-out"
              :class="{ 'bg-gradient-to-r from-indigo-500 to-purple-600 text-white shadow-md': currentChatId === chat.id, 'hover:bg-gray-100': currentChatId !== chat.id }">
            <div class="flex items-center justify-between" @click="selectChat(chat.id)">
              <span>{{ chat.title }}</span>
              <button v-if="currentChatId === chat.id" @click.stop="startRenaming(chat)" class="text-white hover:text-gray-200">
                <PencilIcon class="w-4 h-4" />
              </button>
            </div>
          </li>
      </ul>
      <button @click="newChat" class="mt-6 bg-gradient-to-r from-indigo-500 to-purple-600 text-white px-4 py-2 rounded-full hover:shadow-lg transition-all duration-200 ease-in-out flex items-center justify-center">
        <PlusIcon class="w-5 h-5 mr-2" />
        New Chat
      </button>
    </div>

    <!-- Main Chat Area -->
    <div class="flex-grow flex flex-col max-w-[80%]">
      <div class="bg-white shadow-sm p-6">
        <h1 class="text-2xl font-bold text-gray-800">
            <span v-if="!isRenaming">{{ currentChat.title }}</span>
            <input v-else
                   v-model="newTitle"
                   @keyup.enter="finishRenaming"
                   @blur="finishRenaming"
                   class="border-b border-indigo-500 focus:outline-none"
                   ref="titleInput"
            />
          </h1>
      </div>
      <div class="flex-grow p-6 overflow-hidden">
        <AIChatWindow :messages="currentChat.messages" @send-message="sendMessage" class="h-full" />
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, nextTick } from 'vue'
import AIChatWindow from '../components/AIChatWindow.vue'
import { ArrowLeftIcon, PlusIcon,PencilIcon } from 'lucide-vue-next'
import { GoogleGenerativeAI } from '@google/generative-ai'

const chatHistory = ref([
  { id: 1, title: 'Gen AI Bot', messages: [
    {
        "sender": "user",
        "text": "How to make a gen AI bot, that is customized to given content."
    },
    {
        "sender": "ai",
        "text": "I don't know. Do it yourself."
    }
] },
  { id: 2, title: 'LLM', messages: [] },
])

const currentChatId = ref(1)
const isRenaming = ref(false)
const newTitle = ref('')
const titleInput = ref(null)

const currentChat = computed(() => 
  chatHistory.value.find(chat => chat.id === currentChatId.value) || { messages: [] }
)

const selectChat = (id) => {
  currentChatId.value = id
}

const newChat = () => {
  const newId = Math.max(...chatHistory.value.map(chat => chat.id)) + 1
  chatHistory.value.push({ id: newId, title: `New Chat ${newId}`, messages: [] })
  currentChatId.value = newId
}

const useGetGenerativeModelGP = async (prompt) => {
  const genAI = new GoogleGenerativeAI('AIzaSyBRazbndYJ-ZoY51MGxDgdc3kLYeqKWiOg')
  const model = genAI.getGenerativeModel({ model: 'gemini-pro' })
//const model = await useGenAi('gemini-pro');
const result = await model.generateContent(prompt);
const response = await result.response;
const text = response.text();

return text;
}

const sendMessage = async (message) => {
  currentChat.value.messages.push({ sender: 'user', text: message })
  let pos = currentChat.value.messages.push({ sender: 'ai', text: "Please wait, generating response..." })
  let x = await useGetGenerativeModelGP(message);
  
  currentChat.value.messages[pos - 1] = { sender: 'ai', text: x }
}

const startRenaming = (chat) => {
    isRenaming.value = true
    newTitle.value = chat.title
    nextTick(() => titleInput.value.focus())
  }
  
  const finishRenaming = () => {
    if (newTitle.value.trim()) {
      const chat = chatHistory.value.find(c => c.id === currentChatId.value)
      if (chat) {
        chat.title = newTitle.value.trim()
      }
    }
    isRenaming.value = false
  }
</script>