<template>
  <q-page padding>
    <div class="row q-col-gutter-lg">
      <div class="col-md-4 col-xs-12">
        <div class="text-h6">Todo</div>
        <div class="q-mt-md" v-for="(todo, key) in todos" :key="key">
          <show :task="todo"/>
        </div>
      </div>
      <div class="col-md-4 col-xs-12">
        <div class="text-h6">In Progress</div>
        <div class="q-mt-md" v-for="(todo, key) in progress" :key="key">
          <show :task="todo"/>
        </div>
      </div>
      <div class="col-md-4 col-xs-12">
        <div class="text-h6">Complete</div>
        <div class="q-mt-md" v-for="(todo, key) in done" :key="key">
          <show :task="todo"/>
        </div>
      </div>
    </div>
  </q-page>
</template>

<script>
import {defineComponent, onMounted, computed} from 'vue';
import Show from "components/task/show";
import {useQuasar} from 'quasar'
import {useStore} from 'vuex'

export default defineComponent({
  components: {Show},
  name: 'PageIndex',
  setup() {
    const $store = useStore();
    const $q = useQuasar()
    /*
    Get todos, progress and done tasks
     from store
     */
    const todos = computed({
      get: () => $store.getters["todo/todos"],
      set: val => {

      }
    })
    const progress = computed({
      get: () => $store.getters["todo/progress"],
      set: val => {

      }
    })

    const done = computed({
      get: () => $store.getters["todo/done"],
      set: val => {

      }
    })

    /*
    Fetch tasks all tasks
     */
    function fetch_tasks() {
      $q.loading.show()
      $store.dispatch('todo/list_tasks').then(r => {
        $q.loading.hide()
      })
        .catch(e => {
          $q.loading.show()
        })
    }

    /*
    Fetch tasks when component is initialized
     */
    onMounted(() => {
      fetch_tasks()
    })
    return {
      todos,
      progress,
      done
    }
  }
})
</script>
