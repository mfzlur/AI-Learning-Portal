<!-- src/components/Announcements.vue -->
<template>
        <li v-for="deadline in deadlines" :key="deadline.task" class="flex items-center justify-between bg-gray-50 p-3 rounded-lg">
        <span class="flex items-center">
            <Calendar class="w-5 h-5 mr-2 text-indigo-500" />
            {{ deadline.task }}
        </span>
        <span class="text-sm px-2 py-1 bg-indigo-100 text-indigo-700 rounded-full">{{ deadline.date }}</span>
        </li>

    <div class="bg-white p-6 rounded-xl shadow-md">
      <h3 class="text-xl font-semibold mb-4 text-gray-800">Announcements</h3>
      <ul class="space-y-3">
        <li v-for="announcement in announcements" :key="announcement.id" class="flex items-center justify-between bg-gray-50 p-3 rounded-lg">
          
          <a href="#" @click.prevent="showAnnouncementDetails(announcement)" class="text-indigo-600 hover:underline">
            {{ announcement.title }}
          </a>
          <span class="text-sm px-2 py-1 bg-indigo-100 text-indigo-700 rounded-full">{{ announcement.date }}</span>
        </li>
      </ul>
    </div>
  
    <!-- Announcement Details Modal -->
    <div v-if="selectedAnnouncement" class="fixed inset-0 backdrop-blur-md bg-opacity-10 flex items-center justify-center z-50">
      <div class="bg-white p-6 rounded-xl shadow-lg max-w-md w-full">
        <h4 class="text-xl font-semibold mb-2">{{ selectedAnnouncement.title }}</h4>
        <p class="text-gray-600 mb-4">{{ selectedAnnouncement.details }}</p>
        <button @click="selectedAnnouncement = null" class="bg-indigo-500 text-white px-4 py-2 rounded hover:bg-indigo-600">
          Close
        </button>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref } from 'vue'
  
  const announcements = ref([
    { id: 1, title: 'New Course Available', details: 'A new course on Advanced Machine Learning is now available. Enroll now!', date: 'Feb 11' },
    { id: 2, title: 'Upcoming Webinar', details: 'Join us for a webinar on "Future of AI" this Friday at 3 PM.', date: 'Feb 07' },
    { id: 3, title: 'System Maintenance', details: 'The platform will be under maintenance on Sunday from 2 AM to 4 AM.', date: 'Feb 02' },
  ])
  
  const selectedAnnouncement = ref(null)
  
  const showAnnouncementDetails = (announcement) => {
    selectedAnnouncement.value = announcement
  }
  </script>