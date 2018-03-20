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

3/13-3/14
    /Task: Clean up authorizations (what teachers can do specificially)
    /Task: Enable students to view the subject standards by progress level
        - student_subject/:id/student_standards 
            -dropdown filter
3/15 -
    Task: Make root path sign in and then redirect?
    Task: Add authorization to new student_standards#index
    Task: REFACTOR to make DRY
        -Use Modules for resuable class methods/scopes? (see screen shot example)
        -ActiveRecord class Scopes! (see below)
            -look into order/sorting especially
            -deal with standards that don't have asn_id
            # standards.map {|s| s.subject_id}
            # sorted_standards = standards.sort_by {|s| s.dot_notation}
            # sorted_standards.each do |standard|
            #     number = number + 10
            #     standard.update(asn_id: number.to_s)
            # end
        -Should I namespace routes?
        -includes vs. joins 
            -If I need to display data from the associated model, use includes; otherwise, joins
    Task: Change standard#new to subject#edit

        class Article < ApplicationRecord
            scope :published, -> { where(published: true) }
        end
        *IS SAME AS*
        def self.published
            where(published: true)
        end
        **CAN add arguments in scope but frowned upon?
 
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

root GET      /                                                            student_subjects#index
           edit_student_standard GET      /student_standards/:id/edit(.:format)                        student_standards#edit
                student_standard GET      /student_standards/:id(.:format)                             student_standards#show
                                 PATCH    /student_standards/:id(.:format)                             student_standards#update
                                 PUT      /student_standards/:id(.:format)                             student_standards#update
         student_subject_section GET      /student_subjects/:student_subject_id/sections/:id(.:format) sections#show
                student_subjects GET      /student_subjects(.:format)                                  student_subjects#index
                                 POST     /student_subjects(.:format)                                  student_subjects#create
                 student_subject GET      /student_subjects/:id(.:format)                              student_subjects#show
                                 DELETE   /student_subjects/:id(.:format)                              student_subjects#destroy
                    edit_section GET      /sections/:id/edit(.:format)                                 sections#edit
                         section PATCH    /sections/:id(.:format)                                      sections#update
                                 PUT      /sections/:id(.:format)                                      sections#update
                       standards POST     /standards(.:format)                                         standards#create
                        standard PATCH    /standards/:id(.:format)                                     standards#update
                                 PUT      /standards/:id(.:format)                                     standards#update
                                 DELETE   /standards/:id(.:format)                                     standards#destroy
                           users GET      /users(.:format)                                             users#index
                            user GET      /users/:id(.:format)                                         users#show
                                 PATCH    /users/:id(.:format)                                         users#update
                                 PUT      /users/:id(.:format)                                         users#update
                                 DELETE   /users/:id(.:format)                                         users#destroy
            new_subject_standard GET      /subjects/:subject_id/standards/new(.:format)                standards#new
           edit_subject_standard GET      /subjects/:subject_id/standards/:id/edit(.:format)           standards#edit
                subject_standard GET      /subjects/:subject_id/standards/:id(.:format)                standards#show
                        subjects GET      /subjects(.:format)                                          subjects#index
                                 POST     /subjects(.:format)                                          subjects#create
                     new_subject GET      /subjects/new(.:format)                                      subjects#new
                    edit_subject GET      /subjects/:id/edit(.:format)                                 subjects#edit
                         subject GET      /subjects/:id(.:format)                                      subjects#show
                                 PATCH    /subjects/:id(.:format)                                      subjects#update
                                 PUT      /subjects/:id(.:format)                                      subjects#update
                                 DELETE   /subjects/:id(.:format)                                      subjects#destroy

FROM SUBJECT#EDIT
    <%= form_for @subject do |f| %>
        <%= render layout: "subjects/form", locals: {f: f} do %>
            <legend><b>Edit Sections</b></legend>
            <b>*Note: Removing a section will also remove all associated standards. Any student progress associated with these standards will be deleted.</b>
        <% end %>
    <% end %>

---

FROM SECTION#EDIT
    <%= form_for @section do |f| %>
        <table>
        <tr>
            <th>Number</th>
            <th>Standard Text</th>
        </tr>
        <% @standards_not_added.each_with_index do |standard_hash, index| %>
        <tr>
            <td><%= text_field_tag "section[standards_attributes][#{index}][dot_notation]" %></td>
            <td>
            <%= check_box_tag "section[standards_attributes][#{index}][description]", standard_hash[:description] %> 
            <%= label_tag "section[standards_attributes][#{index}][description]", standard_hash[:description] %>
            <%= hidden_field_tag "section[standards_attributes][#{index}][subject_id]", @subject.id %>
            <%= hidden_field_tag "section[standards_attributes][#{index}][asn_id]", standard_hash[:asn_id] %>
            </td>
        </tr>
        <% end %>
    </table>
    <%= f.submit %>
    <% end %>
