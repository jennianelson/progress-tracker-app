module StudentStandardsHelper

    def description(student_standard)
        student_standard.standard.description
    end

    def dot_notation(student_standard)
        student_standard.standard.dot_notation
    end

    def section(student_standard)
        student_standard.standard.section
    end

    def progress_column_options(ss)
        if ss.progress_level 
            ss.progress_level
        else 
            if policy(ss).update?
                link_to "Add Progress", edit_student_standard_path(ss)
            else
                "Student has not entered progress."
            end
        end 
    end

end