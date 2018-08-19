class ProgressTrackerService {
  constructor() {
    // const baseUrl = "http://localhost:3000/"
  }

  getStudentSubject(link) {
    return fetch(link)
    .then(res => res.json())
  }
}