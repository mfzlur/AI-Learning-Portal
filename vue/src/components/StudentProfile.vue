<template>
    <div class="bg-white rounded-lg shadow p-6">
      <!-- Profile Header -->
      <div class="flex items-center justify-between mb-8">
        <div class="flex items-center space-x-4">
          <img 
            :src="student.avatar || '/placeholder.svg?height=48&width=48'" 
            class="w-12 h-12 rounded-full"
            alt="Profile"
          />
          <div>
            <h2 class="text-xl font-bold">{{ student.name }}</h2>
            <p class="text-sm text-gray-500">Roll No: {{ student.rollNo }}</p>
          </div>
        </div>
        <div class="flex items-center space-x-8">
          <div class="text-center">
            <p class="text-2xl font-bold">{{ student.notesCreated }}</p>
            <p class="text-sm text-gray-500">Notes Created</p>
          </div>
          <div class="text-center">
            <p class="text-2xl font-bold">{{ student.hoursOfEffort }}</p>
            <p class="text-sm text-gray-500">Hours of Effort</p>
          </div>
          <select v-model="selectedWeek" class="rounded-md border-gray-300">
            <option value="1">Week 1</option>
            <option value="2">Week 2</option>
            <option value="3">Week 3</option>
          </select>
        </div>
      </div>
  
     
  
      <!-- Student Details -->
      <div class="grid grid-cols-2 gap-8 mb-8">
        <div>
          <div class="space-y-4">
            <div>
              <p class="text-sm text-gray-500">Level</p>
              <p class="font-medium">{{ student.level }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Email ID</p>
              <p class="font-medium">{{ student.email }}</p>
            </div>
          </div>
        </div>
        <div>
          <div class="space-y-4">
            <div>
              <p class="text-sm text-gray-500">Date of Birth</p>
              <p class="font-medium">{{ student.dob }}</p>
            </div>
            <div>
              <p class="text-sm text-gray-500">Phone Number</p>
              <p class="font-medium">{{ student.phone }}</p>
            </div>
          </div>
        </div>
      </div>
  
      <!-- Topics and Progress -->
      <div class="grid grid-cols-2 gap-8">
        <!-- Topics Checklist -->
        <div>
          <h3 class="text-lg font-semibold mb-4">Topics Checklist</h3>
          <div class="space-y-3">
            <div v-for="topic in topics" :key="topic.id" class="flex items-center">
              <input
                type="checkbox"
                :checked="topic.completed"
                class="h-4 w-4 text-[#6C63FF] rounded border-gray-300"
              />
              <span class="ml-3">{{ topic.name }}</span>
            </div>
          </div>
        </div>
  
        <!-- Revision Plan -->
        <div>
          <h3 class="text-lg font-semibold mb-4">Revision Plan</h3>
          <div class="bg-gray-50 rounded-lg p-4">
            <table class="w-full">
              <thead>
                <tr class="text-sm text-gray-500">
                  <th class="text-left py-2">Day</th>
                  <th class="text-left py-2">Hours</th>
                  <th class="text-left py-2">Topics</th>
                  <th class="text-left py-2">Status</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="plan in revisionPlan" :key="plan.day">
                  <td class="py-2">{{ plan.day }}</td>
                  <td class="py-2">{{ plan.hours }}</td>
                  <td class="py-2">{{ plan.topics }}</td>
                  <td class="py-2">
                    <span :class="`px-2 py-1 rounded-full text-xs ${plan.status === 'Complete' ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}`">
                      {{ plan.status }}
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
  
      <!-- Action Buttons -->
      <div class="flex justify-end space-x-4 mt-8">
        <button class="bg-gray-900 text-white px-4 py-2 rounded-md flex items-center">
          <span class="mr-2">↓</span>
          Download Notes
        </button>
        <button class="border border-gray-900 text-gray-900 px-4 py-2 rounded-md flex items-center">
          <span class="mr-2">👁</span>
          View Notes
        </button>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const selectedWeek = ref('1')
  const student = ref({
    name: 'Rohan Paul',
    rollNo: '24f100xxxx',
    avatar: null,
    notesCreated: 24,
    hoursOfEffort: 38,
    level: 'Diploma',
    email: '24f100xxxx@ds.study.iitm.ac.in',
    dob: '15/03/2000',
    phone: '+91 xxxxx xxxxx'
  })
  
  const topics = ref([
    { id: 1, name: 'Introduction to Arrays', completed: true },
    { id: 2, name: 'Basic Algorithms', completed: true },
    { id: 3, name: 'Data Structures', completed: false }
  ])
  
  const revisionPlan = ref([
    { day: 'Monday', hours: 1, topics: 'Arrays & Lists', status: 'Complete' },
    { day: 'Tuesday', hours: 2, topics: 'Basic Algorithms', status: 'In Progress' }
  ])
  </script>