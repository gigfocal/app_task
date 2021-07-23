<template>
  <q-layout view="lHh Lpr lFf">
    <q-header class="bg-white text-dark">
      <q-toolbar>
        <q-space/>
        <q-btn unelevated  @click="download" class="bg-orange text-white q-mr-lg" no-caps label="Export" icon="file_download"/>
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
    async  download(){
      this.$q.loading.show({
        message: 'Downloading..',
        spinnerSize: "5em",
      });
      await this.$axios.get("todos/tasks/", {params: {action: "export"}})
        .then((response) => {
          this.$q.loading.hide();
          let fileURL = window.URL.createObjectURL(new Blob([response.data]));
          let fileLink = document.createElement('a');

          fileLink.href = fileURL;
          fileLink.setAttribute('download', "tasks");
          document.body.appendChild(fileLink);

          fileLink.click();
        })
        .catch((e) => {
          this.$q.loading.hide();
        })
    },
    async onFileSelect(e) {
      const file = e.target.files[0]
      this.$q.loading.show()
      await  this.$store.dispatch(`todo/import_tasks`, {file: file, action: "import"})
      .then(r => {
        this.$q.loading.hide()
      })
      .catch(e => {
        this.$q.loading.hide()
      })
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
