<template>
    <div class="min-h-screen bg-white p-6">
      <!-- Course Header -->
      <div class="flex justify-between items-center mb-6 bg-gray-100 p-4 rounded-lg">
        <h1 class="text-2xl font-bold text-gray-900">{{ courseName }}</h1>
        <div class="flex space-x-4">
          <router-link to="/ai-assistant">
  <button class="text-[#6C63FF]">
    <MessageSquare class="w-5 h-5" />
  </button>
</router-link>


        </div>
      </div>
  
      <!-- Weeks List -->
      <div class="space-y-4">
        <div v-for="week in weeks" :key="week.number" class="border rounded-lg">
          <!-- Week Header -->
          <button 
            class="w-full p-4 flex justify-between items-center hover:bg-gray-50"
            @click="toggleWeek(week.number)"
          >
            <span class="font-medium">Week {{ week.number }}</span>
            <ChevronDown 
              class="w-5 h-5 transform transition-transform duration-200"
              :class="{ 'rotate-180': expandedWeek === week.number }"
            />
          </button>
  
          <!-- Week Content -->
          <div v-if="expandedWeek === week.number" class="p-4 border-t space-y-4">
            <!-- Topics -->
            <div class="space-y-2">
              <h3 class="font-medium text-[#6C63FF]">Topics</h3>
              <div v-for="topic in week.topics" :key="topic.id" 
                class="pl-4 py-2 hover:bg-gray-50 cursor-pointer"
                @click="goToTopic(topic)"
              >
                {{ topic.title }}
              </div>
            </div>
  
            <!-- Graded Assignment -->
            <div>
              <h3 class="font-medium text-[#6C63FF]">Graded Assignment</h3>
              <div 
                class="pl-4 py-2 hover:bg-gray-50 cursor-pointer"
                @click="goToga(week.gradedAssignment.id)"
              >
                {{ week.gradedAssignment.title }}
              </div>
            </div>
  
            <!-- Programming Assignments -->
            <div>
              <h3 class="font-medium text-[#6C63FF]">Programming Assignments</h3>
              <div v-for="assignment in week.programmingAssignments" 
                :key="assignment.id"
                class="pl-4 py-2 hover:bg-gray-50 cursor-pointer"
                @click="goTopa(assignment.id)"
              >
                {{ assignment.title }}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  import { MessageSquare, Share2, User, ChevronDown } from 'lucide-vue-next'
  import { useRouter } from 'vue-router'
  
  const router = useRouter()
  const courseName = ref('Data Structures and Algorithms')
  const expandedWeek = ref(null)
  
  // Generate 12 weeks of content
  const weeks = ref(Array.from({ length: 12 }, (_, i) => ({
    number: i + 1,
    topics: Array.from({ length: 7 }, (_, j) => ({
      id: `w${i+1}t${j+1}`,
      title: `Topic ${j + 1}: ${getTopicTitle(i + 1, j + 1)}`
    })),
    gradedAssignment: {
      id: `w${i+1}ga`,
      title: `Week ${i + 1} Graded Assignment`
    },
    programmingAssignments: Array.from({ length: 3 }, (_, k) => ({
      id: `w${i+1}pa${k+1}`,
      title: `Programming Assignment ${k + 1}`
    }))
  })))
  
  function getTopicTitle(week, topic) {
    // Sample topic titles - you can customize these
    const topics = [
      'Introduction to Concepts',
      'Basic Implementation',
      'Advanced Features',
      'Problem Solving',
      'Optimization Techniques',
      'Real-world Applications',
      'Practice Problems'
    ]
    return topics[topic - 1]
  }
  
  const toggleWeek = (weekNumber) => {
    expandedWeek.value = expandedWeek.value === weekNumber ? null : weekNumber
  }
  
  const navigateTo = (type, id) => {
    router.push({
      name: type,
      params: { id }
    })
  }
  function goTopa(id) {
  router.push(`/pa`);
}
function goToga(id) {
  router.push(`/ga`);
}
function goToTopic(topic) {
  router.push(`/topic`);
}
  </script>