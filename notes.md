2/26
    Admin/teacher should be able to add standards for any subject but need to test more
    Student only has access to student subjects, student standards routes
        /Task: Dot notation sorting is no longer working--need to come up with a different way to sort correctly
2/27            *Fixed this by use dashes instead of dots
    /Task: Ability to edit standards and sections 
        /*Not thrilled about the way standards can be edited; need ability to both edit description, and add more standards from API
           /*Admin can add more standards in section edit.
3/1
    /Task: Need to keep students from editing other students's standards and subjects!
    /Task: Keep working on Section edit with nested form to add standards. Trying to use checkboxes
        /*Ready to work on update action 

3/7
    /Task: Create user show where admin can remove student_subjects from students
        /STUDENT STANDARDS ARE BEING ORPHANED!
    /Task: Change student_subject show table to just include progress.
        /Task: Add student_standard show page for student to add comments, project notes etc.

3/8
    /Task: Teachers can view student progress 
        /Section is nested under student_subject
    /Task: Students can't view or edit other students' standards progress
    /Task: Teachers should only be able to view student progress, not edit
    /Task: Page links for teachers and admin need to be different
    /Task: Student subject/standard policy

3/13
    Task: Clean up authorizations (what teachers can do specificially)
    Task: Enable students to view the section standards by progress level
        -From section show page
            - 

Authorization:
    ADMIN: 
        -Create, edit, delete all subjects and sections
        -Create, edit, delete standards
        -Change user roles
        -Delete student subjects


Admin Routes
    Subject Index(root): /subjects              subjects_path
    Subject Show: /teacher/subjects/:id         subject_path(:id)
        -Displays Sections & Standards
        -Link to Add Subject
    Subject New: /teacher/subjects/new          new_subject_path
      (Subject Create: /subjects)
    Subject Edit: /teacher/subjects/:id/edit    edit_subject_path(subject)
      (Subject Update: /teacher/subjects/:id)
      (Subject Destroy: /teacher/subjects/:id)
    
    Section Show: /sections/:id                 section_path(section)

-----
