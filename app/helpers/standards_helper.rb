module StandardsHelper
    require 'bigdecimal'

    def section_title(standard)
        standard.section.title
    end

    def subject_title(standard)
        standard.subject.title
    end

    def sort_standards(standards)
        standards.sort_by {|s| s.dot_notation}
    end

    def display_sub_standard(standard)
        'margin-left: 15px; list-style-type:circle;' if standard.dot_notation =~ /[a-z]/
    end
end