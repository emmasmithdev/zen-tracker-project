const baseURL = 'https://arcane-peak-53020.herokuapp.com/api/heroku_1kf5x7pr/footprint'

export default {
  getFootprints() {
    return fetch(baseURL)
    .then(res => res.json())
  },
  postFootprint(payload) {
    return fetch(baseURL, {
      method: 'POST',
      body: JSON.stringify(payload),
      headers: {'Content-Type': 'application/json'}
    })
    .then(res => res.json())
  },
  deleteFootprint(id) {
    return fetch(baseURL + id, {
      method: 'DELETE'
    })
  }
}
