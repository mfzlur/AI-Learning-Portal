<!-- src/components/DashboardWidgets.vue -->
<template>
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mt-14">
        <!-- Progress Widget -->
        <ProfileGrid />
        <PersonalizedNotes />
        <PersonalizedSuggestions />
    </div>
    </template>
    
    <script setup>
    import { ref } from 'vue'
    import { Calendar } from 'lucide-vue-next'
    import ProfileGrid from './ProfileGrid.vue'
    import PersonalizedSuggestions from './PersonalizedSuggestions.vue'
    import PersonalizedNotes from './PersonalizedNotes.vue'
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
