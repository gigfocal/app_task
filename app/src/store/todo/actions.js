export function list_tasks({commit, dispatch}, params) {
  return new Promise((resolve, reject) => {
    this.$axios.get(`todos/tasks/`)
      .then((r => {
        commit('store_tasks', r.data['tasks']);
        return resolve(r);
      }))
      .catch((e => {
        return reject(e);
      }))
  })
}
export function import_tasks({commit, dispatch}, params) {
  return new Promise((resolve, reject) => {
    const config = {
      headers: {
        'Content-Type': 'multipart/form-data'
      }
    }
    let form_data = new FormData()
    form_data.append('file', params['file']);
    this.$axios.post(`todos/tasks/`, form_data, config)
      .then((r => {
        commit('store_tasks', r.data['tasks']);
        return resolve(r);
      }))
      .catch((e => {
        return reject(e);
      }))
  })
}

export function add_task({commit, dispatch}, params) {
  return new Promise((resolve, reject) => {
    this.$axios.post('todos/tasks', params)
      .then((r => {
        commit('update_tasks_list', r.data['task']);
        return resolve(r);
      }))
      .catch((e => {
        return reject(e);
      }))
  })
}

export function update_task({commit, dispatch}, params) {
  return new Promise((resolve, reject) => {
    this.$axios.patch(`todos/tasks/${params['id']}`, params)
      .then((r => {
        commit('update_task', r.data['task']);
        return resolve(r);
      }))
      .catch((e => {
        return reject(e);
      }))
  })
}

export function delete_task({commit, dispatch}, params) {
  let task = params;
  return new Promise((resolve, reject) => {
    this.$axios.delete(`todos/tasks/${params['id']}`)
      .then((r => {
        commit('delete_task', task);
        return resolve(r);
      }))
      .catch((e => {
        return reject(e);
      }))
  })
}
