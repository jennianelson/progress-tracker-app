module StudentStandardsHelper

    def description(student_standard)
        student_standard.standard.description
    end

    def dot_notation(student_standard)
        student_standard.standard.dot_notation
    end

end