const baseURL = 'http://localhost:3000/api/footprint/'

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
