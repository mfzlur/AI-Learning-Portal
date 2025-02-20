<template>
    <div class="bg-white rounded-lg shadow p-3">
        <div class="grid grid-cols-1 gap-8">
        <!-- Topics Checklist -->
        <div>
          <h3 class="text-lg font-semibold mb-4">Personalized Suggestions</h3>
          <div class="space-y-3">
            <div v-for="topic in topics" :key="topic.id" class="flex items-center">
              <p>{{ topic.name }}</p>
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
    { id: 1, name: 'Seems like week 4 contents are interesting. Have a look at it to feel the algorithms.'},
    { id: 2, name: 'We noticed that you love doing practice assignments. Wanna do more?'},
    { id: 3, name: 'Seems like you didnot understand the week 6 contents. If needed, generate notes. I am always ready to help you'}
  ])
  
  

  </script>