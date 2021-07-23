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
import {defineComponent} from 'vue';
import Show from "components/task/show";

export default defineComponent({
  name: 'PageIndex',
  components: {Show},
  data() {
    return {}
  },
  computed: {
    todos() {
      return this.$store.getters['todo/todos']
    },
    progress() {
      return this.$store.getters['todo/progress']
    },
    done() {
      return this.$store.getters['todo/done']
    }
  }
})
</script>
