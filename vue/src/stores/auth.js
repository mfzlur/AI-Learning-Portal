// src/stores/auth.js
import { defineStore } from 'pinia'
import { initializeApp } from "firebase/app";
import { getAuth, GoogleAuthProvider, signInWithPopup } from "firebase/auth";
const firebaseConfig = {
    apiKey: "AIzaSyBh_S7CIo0gwAF3xymJQkJDg3B-dEmNepI",
    authDomain: "seekv2-1e019.firebaseapp.com",
    projectId: "seekv2-1e019",
    storageBucket: "seekv2-1e019.firebasestorage.app",
    messagingSenderId: "852290884554",
    appId: "1:852290884554:web:91de4ada6ad21addc47533"
  };
const app = initializeApp(firebaseConfig);
const auth = getAuth(app);
const provider = new GoogleAuthProvider();
const signInWithGoogle = async () => {
    try {
      const result = await signInWithPopup(auth, provider);
      const token = await result.user.getIdToken();
      return token;
    } catch (error) {
      console.error(error);
    }
  };
  
const defaultAuth = () => ({
    authToken: "",
    isAuthenticated: false,
    user: {}
})
const getSettings = () => {
    const auth = localStorage.getItem("AuthStore")
    return auth ? JSON.parse(auth) : defaultAuth()
}

export const useAuthStore = defineStore('auth', {
  state: () => {return getSettings()},
  actions: {
    async loginWithGoogle() {
      /*const token = await signInWithGoogle();
      const response = await fetch("http://localhost:5000/auth/google", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ token }),
      });
      const data = await response.json();
      console.log(data);*/
      const user = { id: 1, name: 'Bhavya Gupta', email: '23f1001542@ds.study.iitm.ac.in' }
      this.user = user
      this.isAuthenticated = true
      localStorage.setItem("AuthStore", JSON.stringify(this.$state))

    },
    logout() {
      this.user = null
      this.isAuthenticated = false
      this.authToken = ""
      localStorage.setItem("AuthStore", JSON.stringify(this.$state))
      // await firebase.auth().signOut()
    }
  }
})