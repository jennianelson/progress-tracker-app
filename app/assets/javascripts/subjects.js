
function StudentSubject({id, subject, user}) {
  this.id = id
  this.subject = subject
  this.user = user
}


StudentSubject.prototype.renderShow = function() {
  return StudentSubject.template(this)
}

StudentSubject.handleOnClick = function() {
  $('.student-subject-link').on("click", (event) => {
    event.preventDefault();
    // clear DOM
    $('.student-subject-list').html("")
    // set url
    const id = event.target.dataset.id
    history.pushState(null, null, 'student_subjects/' + id)
    // get clicked student subject from API
    const link = event.target.href
    fetch(link + '.json').then(res => res.json()).then(json => {
      let ss = new StudentSubject(json)
      let showHtml = ss.renderShow()
      $('.student-subject-show').append(showHtml)
    })
  })
}

StudentSubject.getStudentSubject = async function(link) {
  let res = fetch(link + '.json')
  debugger
  let json = await res.json()
  return json
}

StudentSubject.ready = function() {
  StudentSubject.templateSource = $('#student-subject-show-template').html();
  StudentSubject.template = Handlebars.compile(StudentSubject.templateSource)
  StudentSubject.handleOnClick()
}

// When document ready
$(function() {
  StudentSubject.ready()
})