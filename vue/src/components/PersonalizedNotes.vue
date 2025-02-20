<template>
    <div class="bg-white rounded-lg shadow p-3">
        <div class="grid grid-cols-1 gap-8">
            <div>
          <h3 class="text-lg font-semibold mb-4">Personalized Notes</h3>
          <div class="bg-gray-50 rounded-lg p-4">
            <table class="w-full">
              <thead>
                <tr class="text-sm text-gray-500">
                  <th class="text-left py-2">Topics</th>
                  <th class="text-left py-2">View</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="note in notes" :key="note.id">
                  <td class="py-2">{{ note.topics }}</td>
                  <td class="py-2">
                    <button class="border border-gray-900 text-gray-900 px-15 py-2 rounded-md flex items-center">
          <span class="mr-1">👁</span>
          View Notes
        </button>
                  </td>
                </tr>
              </tbody>
            </table>
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
  
  const notes = ref([
    { id: 1, topics: 'Arrays & Lists'},
    { id: 2, topics: 'Basic Algorithms'}
  ])
  

  </script>