<!-- src/components/Announcements.vue -->
<template>
    <div class="bg-white p-6 rounded-xl shadow-md">
      <h3 class="text-xl font-semibold mb-4 text-gray-800">Announcements</h3>
      <ul class="space-y-3">
        <li v-for="announcement in announcements" :key="announcement.id" class="flex items-center text-sm">
          <div class="w-2 h-2 bg-indigo-500 rounded-full mr-3"></div>
          <a href="#" @click.prevent="showAnnouncementDetails(announcement)" class="text-indigo-600 hover:underline">
            {{ announcement.title }}
          </a>
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
    { id: 1, title: 'New Course Available', details: 'A new course on Advanced Machine Learning is now available. Enroll now!' },
    { id: 2, title: 'Upcoming Webinar', details: 'Join us for a webinar on "Future of AI" this Friday at 3 PM.' },
    { id: 3, title: 'System Maintenance', details: 'The platform will be under maintenance on Sunday from 2 AM to 4 AM.' },
  ])
  
  const selectedAnnouncement = ref(null)
  
  const showAnnouncementDetails = (announcement) => {
    selectedAnnouncement.value = announcement
  }
  </script>