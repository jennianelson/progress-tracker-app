module StudentStandardsHelper

    def student_standard_description(student_standard)
        student_standard.standard.description
    end

    def student_standard_dot_notation(student_standard)
        student_standard.standard.dot_notation
    end

    def student_standard_section(student_standard)
        student_standard.standard.section
    end

    def student_standard_subject(student_standard)
        student_standard.standard.subject
    end

    def student_standard_user_name(student_standard)
        student_standard.user.name
    end

    def progress_column_options(ss)
        if ss.progress_level 
            ss.progress_level
        else 
            if policy(ss).update?
                link_to "Add Progress", edit_student_standard_path(ss)
            else
                "#{ss.user.name} has not entered progress."
            end
        end 
    end

end