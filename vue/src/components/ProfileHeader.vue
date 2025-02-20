<template>
  <div>
    <header class="mb-8 flex justify-between items-center mt-4 ml-4 mr-4">
    <h2 class="text-3xl font-bold text-gray-800">My Profile</h2>
    <button @click="logout" class="bg-gradient-to-r from-indigo-500 to-purple-600 text-white px-6 py-2 rounded-full hover:shadow-lg transition-all duration-200 ease-in-out">
    Log Out
    </button>
</header>
    <div class="bg-white rounded-lg shadow p-3 mt-8">
<div class="flex items-center justify-between mb-8">
        <div class="flex items-center space-x-4">
          <User class="text-purple-500" />
          <div>
            <h2 class="text-xl font-bold">{{ student.name }}</h2>
            <p class="text-sm text-gray-500">Roll No: {{ student.rollNo }}</p>
          </div>
        </div>

      </div>
    </div></div>
</template>

<script setup>
  import { ref } from 'vue'
  import { User } from 'lucide-vue-next'
  const selectedWeek = ref('1')
  const student = ref({
    name: 'Bhavya Gupta',
    rollNo: '24f100xxxx',
    avatar: null,
    notesCreated: 24,
    hoursOfEffort: 38,
    level: 'Diploma',
    email: '24f100xxxx@ds.study.iitm.ac.in',
    dob: '15/03/2000',
    phone: '+91 xxxxx xxxxx'
  })
  

  </script>
