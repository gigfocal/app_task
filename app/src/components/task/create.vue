<template>
  <q-form @submit="add_task">
    <q-card-section>
      <label>Task title</label>
      <q-input placeholder="Going shopping" outlined square dense v-model="task.title" color="grey-5"/>
    </q-card-section>

    <q-card-section class="q-pt-none">
      <label>Due date</label>
      <q-input dense square outlined color="grey-5" v-model="task.due_date">
        <template v-slot:prepend>
          <q-icon name="event" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-date v-model="task.due_date" mask="YYYY-MM-DD HH:mm">
                <div class="row items-center justify-end">
                  <q-btn v-close-popup label="Close" color="primary" flat />
                </div>
              </q-date>
            </q-popup-proxy>
          </q-icon>
        </template>

        <template v-slot:append>
          <q-icon name="access_time" class="cursor-pointer">
            <q-popup-proxy transition-show="scale" transition-hide="scale">
              <q-time v-model="task.due_date" mask="YYYY-MM-DD HH:mm" format24h>
                <div class="row items-center justify-end">
                  <q-btn v-close-popup label="Close" color="primary" flat />
                </div>
              </q-time>
            </q-popup-proxy>
          </q-icon>
        </template>
      </q-input>
    </q-card-section>

    <q-card-section>
      <label>Status</label>
      <q-select
        dense square outlined
        color="grey-5"
        v-model="task.status"
        :options="statuses"
        options-cover
      />
    </q-card-section>
    <q-card-section>
      <q-btn class="full-width" unelevated color="green" label="Add Task" no-caps/>
    </q-card-section>
  </q-form>
</template>

<script>
export default {
  name: "create",
  data(){
    return{
      task: {
        title: "",
        due_date: "",
        status: ""
      },
      submitting: false
    }
  },
  computed: {
    statuses(){
      return ["todo", "progress", "done"]
    }
  },
  methods: {
    add_task(){
      this.submitting = true
      this.$store.dispatch('todo/add_task', this.task).then((r) => {
        this.submitting = false
      })
      .catch((e) => {
        this.submitting = false
      })
    }
  }
}
</script>

<style scoped>

</style>
