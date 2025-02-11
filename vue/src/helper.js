import { AuthStore } from "./stores/main";
import API_URL from "./constants";
import router from "./router/index.js"
export async function fetchData(path) {
    var store = AuthStore()

    const response = await fetch(API_URL+path, {
        headers: {
            'Authorization': `Bearer ${store.authToken}`
        }
    })

    // check if response code is 200
    if (!response.ok) {
        //logout and redirect to /error
        store.logout()
        router.push({ name: 'error' })
    }
    return await response.json()
}

export async function postData(path, data) {
    var store = AuthStore()

    const response = await fetch(API_URL+path, {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${store.authToken}`,
        },
        body: data
    })

    // check if response code is 200
    if (!response.ok) {
        //logout and redirect to /error
        store.logout()
        router.push({ name: 'error' })
    }
    return await response.json()
}

export async function postJSON(path, data) {
    var store = AuthStore()

    const response = await fetch(API_URL+path, {
        method: 'POST',
        headers: {
            'Authorization': `Bearer ${store.authToken}`,
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })

    if (!response.ok) {
        store.logout()
        router.push({ name: 'error' })
    }
    return await response.json()
}

