
function StudentSubject({id, subject, user}) {
  this.id = id
  this.subject = subject
  this.user = user
}

StudentSubject.getIndex = async function() {
  // debugger
  await fetch('/student_subjects.json').then(res => res.json()).then(json => {
    let ssArray = json.map(ss => new StudentSubject(ss))
    ssArray.forEach(ss => {
      let indexHtml = ss.renderIndex()
      $('.student-subject-index').append(indexHtml)
    }) 
  })
  await StudentSubject.bindClickHandlers()
}

StudentSubject.prototype.renderShow = function() {
  return StudentSubject.showTemplate(this)
}

StudentSubject.prototype.renderIndex = function() {
  // debugger
  return StudentSubject.indexTemplate(this)
}

StudentSubject.bindClickHandlers = function() {
  // debugger
  $('.student-subject-link').on("click", (event) => {
    event.preventDefault();
    // clear DOM
    $('.student-subject-home').html("")
    // set url
    const id = event.target.dataset.id
    history.pushState(null, null, 'student_subjects/' + id)
    // get clicked student subject from API
    const link = event.target.href
    // need to abstract this out
    fetch(link + '.json').then(res => res.json()).then(json => {
      let ss = new StudentSubject(json)
      let showHtml = ss.renderShow()
      $('.student-subject-show').append(showHtml)
    })
  })
}

// not working yet
StudentSubject.getStudentSubject = async function(link) {
  let res = fetch(link + '.json')
  debugger
  let json = await res.json()
  return json
}

StudentSubject.ready = function() {
  StudentSubject.createTemplates()
  StudentSubject.getIndex()
}

StudentSubject.createTemplates = function () {
  StudentSubject.showSource = $('#student-subject-show-template').html();
  StudentSubject.showTemplate = Handlebars.compile(StudentSubject.showSource)

  StudentSubject.indexSource = $('#student-subject-index-template').html();
  StudentSubject.indexTemplate = Handlebars.compile(StudentSubject.indexSource)
}

// When document ready
$(function() {
  StudentSubject.ready()
})