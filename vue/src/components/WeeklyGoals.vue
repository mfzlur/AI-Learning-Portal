<!-- src/components/CourseGrid.vue -->
<template>
    <div class="bg-white rounded-lg shadow p-3">
      <h3 class="text-lg font-semibold mb-4">Weekly Goals</h3>  
<p>Week 1 focuses on fundamental Data Structures. Key areas include arrays, linked lists and basic sorting algorithms</p>
        <div class="flex justify-center space-x-4 mt-5">
        <button class="bg-gray-900 text-white px-12 py-2 rounded-md flex items-center">
          <span class="mr-2">↓</span>
          Download Notes
        </button>
        <button class="border border-gray-900 text-gray-900 px-15 py-2 rounded-md flex items-center">
          <span class="mr-1">👁</span>
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