<template>
    <div class="bg-white rounded-lg shadow p-3">
        <div class="grid grid-cols-1 gap-8">
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