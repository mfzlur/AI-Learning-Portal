import { createRouter, createWebHistory } from 'vue-router'
import Login from '../views/Login.vue'
import Dashboard from '../views/Dashboard.vue'
import CourseNavigationPage from '../views/CourseNavigationPage.vue'
import Courses from '../views/Courses.vue'
import Feedback from '../views/Feedback.vue'
import Profile from '../views/Profile.vue'
import GradedAssignmentPage from '../views/GradedAssignmentPage.vue'
import ProgrammingAssignmentPage from '../views/ProgrammingAssignmentPage.vue'
import EachCourse from '../views/EachCourse.vue'
import InstructorDashboardPage from '../views/InstructorDashboardPage.vue'
import DeveloperDashboardPage from '../views/DeveloperDashboardPage.vue'
import SubjectSelectionPage from '../views/SubjectSelectionPage.vue'
import { useAuthStore } from '../stores/auth'
import AIAssistantView from '../views/AIAssistantView.vue'
import CourseNavigation2 from '../components/CourseNavigation2.vue'


const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      redirect: '/login'
    },
    {
      path: '/login',
      name: 'Login',
      component: Login
    },
    {
      path: '/dashboard',
      name: 'Dashboard',
      component: Dashboard,
      meta: { requiresAuth: true }
    },
    {
      path: '/ai-assistant',
      name: 'AIAssistant',
      component: AIAssistantView,
      meta: { requiresAuth: true }
    },
    {
      path: '/my-courses',
      name: 'Courses',
      component: Courses,
      meta: { requiresAuth: true }
    },
    {
      path: '/course/:courseId',
      name: 'CourseNavigationPage',
      component: CourseNavigation2,
      meta: { requiresAuth: true }
    },
    {
      path: '/feedback',
      name: 'Feedback',
      component: Feedback,
      meta: { requiresAuth: true }
    },
    {
      path: '/profile',
      name: 'Profile',
      component: Profile,
      meta: { requiresAuth: true }
    },
    {
      path: '/ga',
      name: 'GradedAssignmentPage',
      component: GradedAssignmentPage,
      meta: { requiresAuth: true }
    },
    {
      path: '/pa',
      name: 'ProgrammingAssignmentPage',
      component: ProgrammingAssignmentPage,
      meta: { requiresAuth: true }
    },
    {
      path: '/topic',
      name: 'EachCourse',
      component: EachCourse,
      meta: { requiresAuth: true }
    },
    {
      path: '/instructor',
      name: 'InstructorDashboardPage',
      component: InstructorDashboardPage,
      meta: { requiresAuth: true }
    },
    {
      path: '/developer',
      name: 'DeveloperDashboardPage',
      component: DeveloperDashboardPage,
      meta: { requiresAuth: true }
    },
    {
      path: '/select-subject',
      name: 'SubjectSelectionPage',
      component: SubjectSelectionPage,
      meta: { requiresAuth: true }
    },
  ]
})


router.beforeEach((to, from, next) => {
  const authStore = useAuthStore()
  if (to.meta.requiresAuth && !authStore.isAuthenticated) {
    next('/login')
  } else {
    next()
  }
})
export default router
