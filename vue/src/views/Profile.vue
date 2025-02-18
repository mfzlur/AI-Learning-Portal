<script setup>
import DefaultLayout from '../layouts/DefaultLayout.vue'
import ProfileHeader from '../components/ProfileHeader.vue'
import ProfileWidgets from '../components/ProfileWidgets.vue'
</script>

<template>
    <DefaultLayout>
        <div class="flex-1 p-8 overflow-y-auto">
            <ProfileHeader />
            <ProfileWidgets />
        </div>
    </DefaultLayout>
</template>
