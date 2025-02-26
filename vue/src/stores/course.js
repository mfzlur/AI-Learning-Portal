// src/stores/course.js
import { defineStore } from 'pinia'

export const useCourseStore = defineStore('course', {
  state: () => ({
    courses: [
      { name: 'DSA', progress: 0 }
      // Add more courses here if needed
    ]
  }),
  actions: {
    updateProgress(courseName, newProgress) {
      const course = this.courses.find(c => c.name === courseName)
      if (course) {
        course.progress = Math.min(Math.max(newProgress, 0), 100)
      }
    }
  }
})
