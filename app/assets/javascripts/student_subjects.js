
function StudentSubject({id, subject, user}) {
  this.id = id
  this.subject = subject
  this.user = user
}

function Subject({id, title}) {
  this.id = id
  this.title = title
}

StudentSubject.getIndex = async function() {
  await fetch('/student_subjects.json').then(res => res.json()).then(json => {
    let ssArray = json.map(ss => new StudentSubject(ss))
    let html = StudentSubject.indexTemplate(ssArray)
    $('.student-subject-index').append(html)
  })
  await StudentSubject.bindClickHandlers()
}

StudentSubject.getForm =  function() {
   fetch('/subjects/ready.json').then(res => res.json()).then(json => {
    let subArray = json.map(sub => new Subject(sub))
    let html = StudentSubject.newTemplate(subArray)
    $('.student-subject-new').append(html)
  })
}

StudentSubject.prototype.renderShow = function() {
  return StudentSubject.showTemplate(this)
}

StudentSubject.bindClickHandlers = function() {
  $('.student-subject-link').on("click", (event) => {
    event.preventDefault();
    // clear DOM
    $('.student-subject-home').html("")
    // set url
    const id = event.target.dataset.id
    history.pushState(null, null, 'student_subjects/' + id)
    // get clicked student subject from API
    const link = event.target.href
    StudentSubject.getStudentSubjectShow(link)
  })

  $('form#new_student_subject').on('submit', function (event) {
    event.preventDefault();
    let params = $(this).serialize()
    let action = event.target.action
    fetch(action, {
      method: 'Post',
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: params
    })
  })
}

StudentSubject.getStudentSubjectShow = function(link) {
  fetch(link + '.json').then(res => res.json()).then(json => {
      let ss = new StudentSubject(json)
      let showHtml = ss.renderShow()
      $('.student-subject-show').append(showHtml)
    })
  }

StudentSubject.ready = function() {
  StudentSubject.createTemplates()
  StudentSubject.getIndex()
  StudentSubject.getForm()
  StudentSubject.bindClickHandlers()
}

StudentSubject.createTemplates = function () {
  StudentSubject.showSource = $('#student-subject-show-template').html();
  StudentSubject.showTemplate = Handlebars.compile(StudentSubject.showSource)

  StudentSubject.newSource = $('#student-subject-new-template').html()
  StudentSubject.newTemplate = Handlebars.compile(StudentSubject.newSource)

  StudentSubject.indexSource = $('#student-subject-index-template').html();
  StudentSubject.indexTemplate = Handlebars.compile(StudentSubject.indexSource)
}

// When document ready
$(function() {
  StudentSubject.ready()
})