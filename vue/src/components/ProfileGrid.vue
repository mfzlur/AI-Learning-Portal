<!-- src/components/CourseGrid.vue -->
<template>
    <div class="bg-white p-6 rounded-xl shadow-md col-span-3">
    <div class="grid grid-cols-3 gap-8 mb-8">
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
              <p class="text-sm text-gray-500">Courses taken</p>
              <p class="font-medium">{{ student.courses }}</p>
            </div></div>
          </div>
          <div>
          <div class="space-y-4">
            <div>
              <p class="text-sm text-gray-500">Phone Number</p>
              <p class="font-medium">{{ student.phone }}</p>
            </div>
          </div>
        </div>
        
      </div></div>
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
    courses: 'Data Structures and Algorithms',
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
