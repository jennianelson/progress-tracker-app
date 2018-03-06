module StandardsHelper

    def section_title(standard)
        standard.section.title
    end

    def subject_title(standard)
        standard.subject.title
    end

    def sort_standards(standards)
        if standards.first.asn_id !=0
            standards.sort_by { |s| s.asn_id }
        else
            standards.sort_by { |s| s.dot_notation }
        end
    end

    def display_sub_standard(standard)
        'margin-left: 15px; list-style-type:circle;' if standard.dot_notation =~ /[a-z]/
    end
end

# standards.map {|s| s.subject_id}
# sorted_standards = standards.sort_by {|s| s.dot_notation}
# sorted_standards.each do |standard|
#     number = number + 10
#     standard.update(asn_id: number.to_s)
# end