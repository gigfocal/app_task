<template>
  <q-layout view="lHh Lpr lFf">
    <q-header class="bg-white text-dark">
      <q-toolbar>
        <q-space/>
        <q-btn unelevated class="bg-orange text-white q-mr-lg" no-caps label="Export" icon="file_download"/>
        <q-btn unelevated class="bg-green text-white q-mr-lg" no-caps label="Import" icon="file_upload"/>
        <q-btn unelevated class="bg-blue text-white" no-caps label="Add Todo" icon="add"/>
      </q-toolbar>
    </q-header>
    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>

import { defineComponent, ref } from 'vue'

export default defineComponent({
  name: 'MainLayout',

  components: {

  },

  setup () {
    const leftDrawerOpen = ref(false)

    return {
      leftDrawerOpen,
    }
  }
})
</script>
