module StandardsHelper

    def section_title(standard)
        standard.section.title
    end

    def subject_title(standard)
        standard.subject.title
    end

    def sort_standards(standards)
        standards.sort_by {|s| s.dot_notation.to_i}
    end
end