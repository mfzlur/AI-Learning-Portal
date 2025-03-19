<template>
    <div class="min-h-screen bg-white p-6">
      <!-- Course Header -->
      <div class="flex justify-between items-center mb-6 bg-gray-100 p-4 rounded-lg">
        <h1 class="text-2xl font-bold text-gray-900">{{ course.name }}</h1>
        <div class="flex space-x-4">
          <router-link to="/ai-assistant">
            <button class="text-[#6C63FF]">
              <MessageSquare class="w-5 h-5" />
            </button>
          </router-link>
        </div>
      </div>
  
      <!-- Loading State -->
      <div v-if="loading" class="flex justify-center items-center py-10">
        <div class="animate-spin rounded-full h-10 w-10 border-b-2 border-[#6C63FF]"></div>
      </div>
  
      <!-- Error State -->
      <div v-else-if="error" class="bg-red-50 p-4 rounded-lg text-red-600">
        {{ error }}
      </div>
  
      <!-- Weeks List -->
      <div v-else class="space-y-4">
        <div v-for="week in weeks" :key="week.number" class="border rounded-lg">
          <!-- Week Header -->
          <button class="w-full p-4 flex justify-between items-center hover:bg-gray-50" @click="toggleWeek(week.number)">
            <span class="font-medium">Week {{ week.number }}</span>
            <ChevronDown class="w-5 h-5 transform transition-transform duration-200"
              :class="{ 'rotate-180': expandedWeek === week.number }" />
          </button>
  
          <!-- Week Content -->
          <div v-if="expandedWeek === week.number" class="p-4 border-t space-y-4">
            <!-- Topics/Lectures -->
            <div v-if="week.lectures.length > 0" class="space-y-2">
              <h3 class="font-medium text-[#6C63FF]">Topics</h3>
              <div v-for="lecture in week.lectures" :key="lecture.id" class="pl-4 py-2 hover:bg-gray-50 cursor-pointer"
                @click="goToTopic(lecture)">
                {{ lecture.title }}
              </div>
            </div>
  
            <!-- Assignments -->
            <div v-if="week.assignments.length > 0">
              <h3 class="font-medium text-[#6C63FF]">Assignments</h3>
              <div v-for="assignment in week.assignments" :key="assignment.id"
                class="pl-4 py-2 hover:bg-gray-50 cursor-pointer" 
                @click="goToAssignment(assignment)">
                {{ assignment.title || `Assignment (Due: ${formatDate(assignment.due_date)})` }}
                <span v-if="assignment.submitted" class="ml-2 text-green-600 text-sm">Submitted</span>
              </div>
            </div>
  
            <!-- Notes -->
            <div v-if="week.notes.length > 0">
              <h3 class="font-medium text-[#6C63FF]">Notes</h3>
              <div v-for="note in week.notes" :key="note.id"
                class="pl-4 py-2 hover:bg-gray-50 cursor-pointer" 
                @click="goToNote(note)">
                {{ note.title }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted, computed } from 'vue'
  import { MessageSquare, ChevronDown } from 'lucide-vue-next'
  import { useRouter, useRoute } from 'vue-router'
  import axios from 'axios'
  
  const router = useRouter()
  const route = useRoute()
  const course = ref({})
  const loading = ref(true)
  const error = ref(null)
  const expandedWeek = ref(null)
  
  // Get course ID from route params
  const courseId = computed(() => route.params.courseId || route.query.courseId)
  
  // Organize data by weeks
  const weeks = computed(() => {
    if (!course.value || !course.value.lectures) return []
    
    // Get all unique week numbers from lectures, assignments and notes
    const weekNumbers = new Set()
    
    if (course.value.lectures) {
      course.value.lectures.forEach(lecture => weekNumbers.add(lecture.week))
    }
    
    if (course.value.assignments) {
      course.value.assignments.forEach(assignment => weekNumbers.add(assignment.week))
    }
    
    if (course.value.notes) {
      course.value.notes.forEach(note => weekNumbers.add(note.week))
    }
    
    // Convert to array and sort
    const sortedWeeks = Array.from(weekNumbers).sort((a, b) => a - b)
    
    // Create week objects
    return sortedWeeks.map(weekNum => {
      return {
        number: weekNum,
        lectures: course.value.lectures.filter(lecture => lecture.week === weekNum) || [],
        assignments: course.value.assignments.filter(assignment => assignment.week === weekNum) || [],
        notes: course.value.notes.filter(note => note.week === weekNum) || []
      }
    })
  })
  
  // Fetch course data
  const fetchCourseData = async () => {
    if (!courseId.value) {
      error.value = "No course ID provided"
      loading.value = false
      return
    }
    
    try {
      loading.value = true
      const response = await axios.get(`/course/${courseId.value}`)
      course.value = response.data
      loading.value = false
    } catch (err) {
      console.error('Error fetching course data:', err)
      error.value = err.response?.data?.error || "Failed to load course data"
      loading.value = false
    }
  }
  
  onMounted(() => {
    fetchCourseData()
  })
  
  const toggleWeek = (weekNumber) => {
    expandedWeek.value = expandedWeek.value === weekNumber ? null : weekNumber
  }
  
  const formatDate = (dateString) => {
    return new Date(dateString).toLocaleDateString()
  }
  
  const goToTopic = (lecture) => {
    router.push(`/lecture/${lecture.id}`)
  }
  
  const goToAssignment = (assignment) => {
    router.push(`/assignment/${assignment.id}`)
  }
  
  const goToNote = (note) => {
    router.push(`/note/${note.id}`)
  }
  </script>
  