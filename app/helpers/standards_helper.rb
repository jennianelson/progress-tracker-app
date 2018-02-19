module StandardsHelper

    def section_title(standard)
        standard.section.title
    end

    def subject_title(standard)
        standard.subject.title
    end

    # def display_standard_text(a)
    #     if a["description"] && a["statementLabel"] != "Disciplinary Core Idea" && a["statementLabel"] != "Domain" 
    #         if a["comments"]
    #             puts "#{a["description"]}"+ "#{a["comments"]}"
    #         else
    #             a["description"]
    #         end
    #     end
    # end
end