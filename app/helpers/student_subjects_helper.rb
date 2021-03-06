module StudentSubjectsHelper

    def user_subjects
        current_user.student_subjects
    end

    def student_subject_title(student_subject)
        student_subject.subject.title
    end

    def student_subject_sections(student_subject)
        student_subject.subject.sections
    end

    def student_subject_name(student_subject)
        student_subject.user.name
    end

end
