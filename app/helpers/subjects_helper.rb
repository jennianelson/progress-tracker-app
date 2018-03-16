module SubjectsHelper

    def subjects_array
        subjects = parse_api("jurisdictions", "B838B98D043045748F3814B9E43CAC85")["data"]["standardSets"]
        subjects.map { |s| [ s["title"] + " " + s["subject"], s["id"] ] }.sort_by {|s| s[1]} 
    end

    def subject_being_used_alert(subject)
        if subject.student_subjects.present?
            "This subject is being used by #{subject.student_subjects.size} student(s). Deleting the subject or any of its sections will also delete the standards and student progress associated with it."
        end
    end
    
end
