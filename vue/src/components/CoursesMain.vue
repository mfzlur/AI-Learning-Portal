<script setup>
import { ref, onMounted } from 'vue';
import { useRouter } from 'vue-router';
import { 
  LayoutDashboard, 
  GraduationCap, 
  Calendar, 
  FileText, 
  Download, 
  PieChart, 
  HelpCircle 
} from 'lucide-vue-next';
import axios from 'axios';

const router = useRouter();
const courses = ref([]);

const fetchCourses = async () => {
  try {
    const response = await axios.get('/courses');
    courses.value = response.data;
  } catch (error) {
    console.error('Error fetching courses:', error);
  }
};

onMounted(fetchCourses);

const menuItems = [
  { name: 'Dashboard', icon: LayoutDashboard },
  { name: 'Courses', icon: GraduationCap },
  { name: 'Assignments', icon: FileText },
  { name: 'Calendar', icon: Calendar },
  { name: 'Certificates', icon: Download },
  { name: 'Reports', icon: PieChart },
  { name: 'Support', icon: HelpCircle },
];

function goToCourse(course) {
  router.push(`/course/${course.id}`);
}
</script>

<template>
  <div class="min-h-screen bg-[#F5F5FF] p-6">
    <div class="flex gap-6">
      <div class="flex-1 space-y-6">
        <div class="bg-white rounded-lg shadow-sm p-6">
          <div class="flex justify-between items-center">
            <div>
              <h2 class="text-2xl font-bold">Bhavya Gupta</h2>
              <p class="text-gray-600">CGPA: 9.65 | Project CGPA: 8.75</p>
            </div>
            <router-link to="/feedback">
              <button class="px-4 py-2 bg-[#6C5CE7] text-white rounded-lg hover:bg-[#5A4BD1] transition-colors">
                Give Feedback
              </button>
            </router-link>
          </div>
        </div>
        
        <div class="bg-white rounded-lg shadow-sm p-6">
          <h3 class="text-xl font-bold mb-4">Need Help?</h3>
          <div class="space-y-3">
            <button class="w-full p-3 bg-[#F5F5FF] text-[#6C5CE7] rounded-lg hover:bg-[#6C5CE7] hover:text-white transition-colors">
              Would you like to generate concise revision notes?
            </button>
            <button class="w-full p-3 bg-[#F5F5FF] text-[#6C5CE7] rounded-lg hover:bg-[#6C5CE7] hover:text-white transition-colors">
              Summarize Week 4 content for me
            </button>
          </div>
        </div>
        
        <div class="bg-white rounded-lg shadow-sm p-6">
          <h3 class="text-xl font-bold mb-4">Current Courses</h3>
          <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            <div v-for="course in courses" :key="course.id" class="bg-[#F5F5FF] rounded-lg p-4" @click="goToCourse(course)">
              <h4 class="font-bold mb-3">{{ course.name }}</h4>
              <div class="space-y-2">
                <div v-for="assignment in course.assignments" :key="assignment.id" class="flex justify-between items-center p-2 bg-white rounded-lg">
                  <span>Week {{ assignment.week }} Assignment</span>
                  <span class="font-medium">{{ assignment.score }}</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
