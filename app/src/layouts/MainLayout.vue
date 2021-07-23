<template>
  <q-layout view="lHh Lpr lFf">
    <q-header class="bg-white text-dark">
      <q-toolbar>
        <q-space/>
        <q-btn unelevated class="bg-orange text-white q-mr-lg" no-caps label="Export" icon="file_download"/>
        <q-btn unelevated class="bg-green text-white q-mr-lg" no-caps label="Import" icon="file_upload"/>
        <q-btn unelevated @click="show_form = true" class="bg-blue text-white" no-caps label="Add Todo" icon="add"/>
      </q-toolbar>
    </q-header>
    <q-page-container>
      <router-view />
    </q-page-container>
    <q-dialog v-model="show_form">
      <q-card style="width: 700px; max-width: 80vw;">
        <create/>
      </q-card>
    </q-dialog>
  </q-layout>
</template>

<script>

import { defineComponent, ref } from 'vue'
import Create from "components/task/create";

export default defineComponent({
  name: 'MainLayout',

  data(){
    return{
      show_form: false
    }
  },
  computed: {

  },
  components: {Create},



})
</script>
