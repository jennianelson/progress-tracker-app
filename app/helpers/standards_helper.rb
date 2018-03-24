module StandardsHelper

    def section_title(standard)
        standard.section.title
    end

    def subject_title(standard)
        standard.subject.title
    end

    def order_standards(standards)
        standards.order(:asn_id)
    end

end