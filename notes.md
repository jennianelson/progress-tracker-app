2/26
    Admin/teacher should be able to add standards for any subject but need to test more
    Student only has access to student subjects, student standards routes
        Task: Dot notation sorting is no longer working--need to come up with a different way to sort correctly
2/27            *Fixed this by use dashes instead of dots
    Task: Ability to edit standards and sections


Admin Routes
    Subject Index(root): /subjects      subjects_path
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
root GET      /                                                          student_subjects#index
                student_subjects GET      /student_subjects(.:format)                                student_subjects#index
                                 POST     /student_subjects(.:format)                                student_subjects#create
                 student_subject GET      /student_subjects/:id(.:format)                            student_subjects#show
   edit_section_student_standard GET      /sections/:section_id/student_standards/:id/edit(.:format) student_standards#edit
        section_student_standard PATCH    /sections/:section_id/student_standards/:id(.:format)      student_standards#update
                                 PUT      /sections/:section_id/student_standards/:id(.:format)      student_standards#update
                         section GET      /sections/:id(.:format)                                    sections#show
                       standards GET      /teacher/standards(.:format)                               standards#index
                                 POST     /teacher/standards(.:format)                               standards#create
                        standard PATCH    /teacher/standards/:id(.:format)                           standards#update
                                 PUT      /teacher/standards/:id(.:format)                           standards#update
            new_subject_standard GET      /teacher/subjects/:subject_id/standards/new(.:format)      standards#new
           edit_subject_standard GET      /teacher/subjects/:subject_id/standards/:id/edit(.:format) standards#edit
                subject_standard GET      /teacher/subjects/:subject_id/standards/:id(.:format)      standards#show
                        subjects GET      /teacher/subjects(.:format)                                subjects#index
                                 POST     /teacher/subjects(.:format)                                subjects#create
                     new_subject GET      /teacher/subjects/new(.:format)                            subjects#new
                    edit_subject GET      /teacher/subjects/:id/edit(.:format)                       subjects#edit
                         subject GET      /teacher/subjects/:id(.:format)                            subjects#show
                                 PATCH    /teacher/subjects/:id(.:format)                            subjects#update
                                 PUT      /teacher/subjects/:id(.:format)                            subjects#update
                                 DELETE   /teacher/subjects/:id(.:format)                            subjects#destroy