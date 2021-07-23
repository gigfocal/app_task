<template>
  <q-layout view="lHh Lpr lFf">
    <q-header class="bg-white text-dark">
      <q-toolbar>
        <q-space/>
        <q-btn unelevated  @click="$refs.fileInput.click()" class="bg-green text-white q-mr-lg" no-caps label="Import" icon="file_upload"/>
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
    <input multiple type="file"  @change="onFileSelect"
           ref="fileInput" style="display: none">
  </q-layout>
</template>

<script>
import mitt from 'mitt'
import { defineComponent, ref } from 'vue'
import Create from "components/task/create";

export default defineComponent({
  name: 'MainLayout',

  data(){
    return{
      show_form: false,
      mime_type: '',
      selectedFile: '',
      crop_dialog: false,
      image: '',
      files: '',
    }
  },
  components: {Create},
  methods: {
    async onFileSelect(e) {
      const file = e.target.files[0]
      await  this.$store.dispatch(`todo/import_tasks`, {file: file, action: "import"})
    },
  },
  mounted() {
    const emitter = mitt()
    emitter.on('update_form_popup_status', function (status) {
      this.show_form = false
    });
  }


})
</script>
