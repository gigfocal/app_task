<template>
  <q-card flat class="bg-blue-1">
   <q-list>
     <q-item>
       <q-item-section avatar>
         <q-radio v-model="status" :val="task.status"/>
       </q-item-section>
       <q-item-section>
         {{task.title}}
       </q-item-section>
       <q-item-section avatar>
         <q-btn flat round icon="more_vert"></q-btn>
       </q-item-section>
     </q-item>
   </q-list>
  </q-card>
</template>

<script>
export default {
  name: "show",
  props: {
    task: Object
  }
}
</script>

<style scoped>

</style>
