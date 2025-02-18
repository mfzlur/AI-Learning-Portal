<template>
  <div>
    <header class="mb-8 flex justify-between items-center mt-4 ml-4 mr-4">
    <h2 class="text-3xl font-bold text-gray-800">Welcome back, instructor!</h2>
</header>
  <div class="bg-white rounded-lg shadow p-6">
    <!-- Navigation -->

    <div class="grid grid-cols-2 gap-8">
      <!-- Most Frequent Questions -->
      <div class="bg-[#F5F5FF] rounded-lg p-6">
        <h2 class="text-xl font-semibold mb-6 text-[#6C63FF]">Most Frequent Questions</h2>
        <div class="space-y-3">
          <div v-for="(question, index) in frequentQuestions" :key="index"
            class="p-3 bg-white rounded-lg shadow-sm border border-[#6C63FF]">
            {{ question }}
          </div>
        </div>
      </div>

      <!-- Low Scoring Concepts -->
      <div class="bg-[#F5F5FF] rounded-lg p-6">
        <h2 class="text-xl font-semibold mb-6 text-[#6C63FF]">Concepts Where Students Scored Low</h2>
        <div class="space-y-3">
          <div v-for="(concept, index) in lowScoringConcepts" :key="index"
            class="p-3 bg-white rounded-lg shadow-sm border border-[#6C63FF]">
            {{ concept }}
          </div>
        </div>
      </div>

      <!-- Analytics Charts -->
      <div class="col-span-2 grid grid-cols-2 gap-8">
        <div class="bg-[#F5F5FF] rounded-lg p-4">
          <h3 class="text-lg font-medium mb-4 text-[#6C63FF]">Weekly Quiz Completion Rates</h3>
          <div class="h-64 bg-white rounded-lg border border-[#6C63FF]">
            <LineChart :data="weeklyQuizData" />
          </div>
        </div>
        <div class="bg-[#F5F5FF] rounded-lg p-4">
          <h3 class="text-lg font-medium mb-4 text-[#6C63FF]">Average Quiz Scores</h3>
          <div class="h-64 bg-white rounded-lg border border-[#6C63FF]">
            <BarChart :data="averageQuizScores" />
          </div>
        </div>
      </div>
    </div>
  </div></div>
</template>

<script setup>
import { ref } from 'vue'
import { LineChart, BarChart } from '@/components/ui/chart'

const frequentQuestions = ref([
  'What is the difference between arrays and linked lists?',
  'How does time complexity affect algorithm performance?',
  'Can you explain the concept of recursion?'
])

const lowScoringConcepts = ref([
  'Dynamic Programming',
  'Graph Algorithms',
  'Advanced Data Structures'
])

const weeklyQuizData = {
  labels: ['Week 1', 'Week 2', 'Week 3', 'Week 4'],
  datasets: [
    {
      label: 'Completion Rate',
      data: [75, 82, 90, 88],
      borderColor: '#6C63FF',
      backgroundColor: 'rgba(108, 99, 255, 0.2)',
    }
  ]
}

const averageQuizScores = {
  labels: ['Quiz 1', 'Quiz 2', 'Quiz 3', 'Quiz 4'],
  datasets: [
    {
      label: 'Average Score',
      data: [65, 70, 75, 72],
      backgroundColor: '#6C63FF',
    }
  ]
}
</script>