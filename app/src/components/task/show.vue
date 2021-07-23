<template>
  <div>
    <q-card flat class="bg-blue-1">
      <q-list>
        <q-item>
          <q-item-section avatar>
            <q-radio v-model="status" :val="task.status"/>
          </q-item-section>
          <q-item-section>
            {{ task.title }}
          </q-item-section>
          <q-item-section avatar>
            <q-btn flat round icon="more_vert">
              <q-menu>
                <q-list style="min-width: 100px">
                  <q-item @click="show_edit_form = true" clickable v-close-popup>
                    <q-item-section>Edit</q-item-section>
                  </q-item>
                  <q-item @click="delete_task(task)" clickable v-close-popup>
                    <q-item-section>Delete</q-item-section>
                  </q-item>
                </q-list>
              </q-menu>
            </q-btn>
          </q-item-section>
        </q-item>
      </q-list>
    </q-card>
    <q-dialog v-model="show_edit_form">
      <q-card style="width: 700px; max-width: 80vw;">
        <edit :task="task"/>
      </q-card>
    </q-dialog>
  </div>
</template>

<script>
import Edit from "components/task/edit";
import mitt from 'mitt'

export default {
  name: "show",
  components: {Edit},
  props: {
    task: Object
  },
  data() {
    return {
      confirm_delete: false,
      show_edit_form: false,
    }
  },
  methods: {
    delete_task(task) {
        this.$q.dialog({
          title: 'Confirm',
          message: 'Are you sure you want to delete this task ?',
          cancel: true,
          persistent: true
        }).onOk(() => {
          this.$q.loading.show()
          this.$store.dispatch('todo/delete_task', {task: task, id: task.id})
            .then(r => {
              this.$q.loading.hide()
            })
            .catch(e => {
              this.$q.loading.hide()
            })
        }).onOk(() => {
          // console.log('>>>> second OK catcher')
        }).onCancel(() => {
          // console.log('>>>> Cancel')
        }).onDismiss(() => {
          // console.log('I am triggered on both OK and Cancel')
        })
      }

    },
  mounted() {
    const emitter = mitt()
    emitter.on('update_edit_form_popup_status', function (status) {
      this.show_edit_form = false;
    });
  }
}
</script>

<style scoped>

</style>
