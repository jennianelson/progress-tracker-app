module SubjectsHelper

    def subject_being_used_alert(subject)
        if subject.student_subjects.present?
            "**This subject is being used by #{subject.student_subjects.size} student(s). Deleting the subject or any of its sections will also delete the standards and student progress associated with it.**"
        end
    end
    
end
