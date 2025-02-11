<!-- src/components/CourseGrid.vue -->
<template>
<div class="bg-white p-6 rounded-xl shadow-md col-span-2">
    <h3 class="text-xl font-semibold mb-4 text-gray-800">My Courses</h3>
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
    <div v-for="course in courses" :key="course.name" class="bg-gray-50 p-4 rounded-lg">
        <h4 class="font-semibold text-lg mb-2">{{ course.name }}</h4>
        <div class="w-full bg-gray-200 rounded-full h-4">
        <div
            class="h-full rounded-full bg-gradient-to-r from-indigo-500 to-purple-600"
            :style="{ width: `${course.progress}%` }"
        ></div>
        </div>
        <div class="mt-2 text-sm text-gray-600">Progress: {{ course.progress }}%</div>
    </div>
    </div>
</div>
</template>

<script setup>
import { ref } from 'vue'

const courses = ref([
{ name: 'BDM', progress: 75 },
{ name: 'DBMS', progress: 60 },
{ name: 'DSA', progress: 85 },
{ name: 'MLP', progress: 15 },
])

</script>