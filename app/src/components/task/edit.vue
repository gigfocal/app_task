<template>
  <q-form @submit="edit_details">
    <q-card-section>
      <label>Task title</label>
      <q-input lazy-rules
               :rules="[ val => val && val.length > 0 || 'Enter title to continue']" placeholder="Going shopping"
               outlined square dense v-model="edit_task.title" color="grey-5"/>
    </q-card-section>

    <q-card-section class="q-pt-none">
      <label>Due date</label>
      <q-input dense square outlined color="grey-5" lazy-rules
               :rules="[ val => val && val.length > 0 && !date_in_the_past || 'Enter valid date and time to continue']"
               v-model="edit_task.due_date">
        <template v-slot:prepend>
          <q-icon name="event" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-date v-model="edit_task.due_date" mask="YYYY-MM-DD HH:mm">
                <div class="row items-center justify-end">
                  <q-btn v-close-popup label="Close" color="primary" flat/>
                </div>
              </q-date>
            </q-popup-proxy>
          </q-icon>
        </template>

        <template v-slot:append>
          <q-icon name="access_time" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-time v-model="edit_task.due_date" mask="YYYY-MM-DD HH:mm" format24h>
                <div class="row items-center justify-end">
                  <q-btn v-close-popup label="Close" color="primary" flat/>
                </div>
              </q-time>
            </q-popup-proxy>
          </q-icon>
        </template>
      </q-input>
    </q-card-section>

    <q-card-section>
      <label>Status</label>
      <q-select lazy-rules
                :rules="[ val => val && val.length > 0 || 'Select Status']"
                dense square outlined
                color="grey-5"
                v-model="edit_task.status"
                :options="statuses"
                options-cover
      />
    </q-card-section>
    <q-card-section>
      <q-btn type="submit" :loading="submitting" class="full-width" unelevated color="green" label="Edit Task" no-caps/>
    </q-card-section>
  </q-form>
</template>

<script>
export default {
  name: "edit",
  props: {
    task: Object
  },
  data() {
    return {
      edit_task: {
        title: "",
        due_date: "",
        status: ""
      },
      submitting: false
    }
  },
  computed: {
    statuses() {
      return ["todo", "progress", "done"]
    },
    date_in_the_past() {
      let now = new Date();
      return this.edit_task.due_date >= now;
    }
  },
  methods: {
    edit_details() {
      this.submitting = true
      this.$store.dispatch('todo/update_task', {task: this.edit_task, id: this.edit_task.id}).then((r) => {
        this.submitting = false
      })
        .catch((e) => {
          this.submitting = false
        })
    }
  },

  mounted() {
    this.edit_task = this.task
  }

}
</script>

<style scoped>

</style>
