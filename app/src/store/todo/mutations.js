export function store_tasks (state, tasks) {
  state.tasks = tasks
}

export function update_tasks_list (state, task){
  state.tasks.unshift(task)
}

export function update_task (state, task){

}

export function delete_task (state, task){
 state.tasks = state.tasks.filter(function(el) { return el.id !== task.id});
}

