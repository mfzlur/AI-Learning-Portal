<template>
    <div class="bg-white rounded-lg shadow p-3">
        <div class="grid grid-cols-1 gap-8">
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
        </div></div></div>
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