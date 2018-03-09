module StudentStandardsHelper

    def description(student_standard)
        student_standard.standard.description
    end

    def dot_notation(student_standard)
        student_standard.standard.dot_notation
    end

    def progress_column_options(ss, section)
        if ss.progress_level 
            ss.progress_level
        else 
            link_to "Add Progress", edit_section_student_standard_path(section, ss)
        end 
    end

end