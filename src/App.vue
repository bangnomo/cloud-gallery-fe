<script setup>
import { RouterView } from "vue-router";
import SiteNavbar from "./components/SiteNavbar.vue";
import SiteFooter from "./components/SiteFooter.vue";
</script>

<template>
  <div class="flex flex-col h-screen">
    <SiteNavbar />
    <main class="flex-grow">
      <RouterView />
    </main>
    <SiteFooter />
  </div>
</template>
