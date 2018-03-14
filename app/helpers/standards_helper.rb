module StandardsHelper

    def section_title(standard)
        standard.section.title
    end

    def subject_title(standard)
        standard.subject.title
    end

    def sort_standards(standards)
        if standards.first.asn_id
            standards.order(:asn_id)
        else
            standards.order(:dot_notation)
        end
    end

end