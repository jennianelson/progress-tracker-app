module StudentSubjectsHelper

    def subject_title(student_subject)
        student_subject.subject.title
    end

    def subject_sections(student_subject)
        student_subject.subject.sections
    end
end
