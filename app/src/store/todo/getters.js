export function todos (state) {
  return state.tasks.filter(function(t) { return t.status === 'todo' })
}

export function progress(state){
  return state.tasks.filter(function(t) { return t.status === 'progress' })
}

export function done(state){
  return state.tasks.filter(function(t) { return t.status === 'done' })
}

