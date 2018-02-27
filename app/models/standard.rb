class Standard < ApplicationRecord
    belongs_to :section
    belongs_to :subject

    has_many :student_standards, dependent: :destroy
    has_many :users, through: :student_standards
   
    validates :description, presence: true
    # accepts_nested_attributes_for :standards

    def standards_attributes=(standards_attributes)
        standards_attributes.each do |i, standard_hash|
            if !standard_hash["include"]
                Standard.create(standard_hash)
            end
        end
    end

    def self.filter_by_section(section_id)
        where(section_id: section_id)
    end

    def self.filter_by_subject(subject_id)
        where(subject_id: subject_id)
    end

    def self.sort_by_subject_and_notation
        order(:subject_id, :dot_notation)
    end

    def self.filter_display(params)
        # binding.pry
        if !params["subjects"] || params["subjects"].empty?
            sort_by_subject_and_notation
        elsif
            !params["subjects"].empty?
            filter_by_subject(params["subjects"]).sort_by_subject_and_notation
        end
    end

    def self.get_standards_array(standards)
        standards.collect do |standard|
            standard.collect do |a|
                if a["description"] && a["statementLabel"] != "Disciplinary Core Idea" && a["statementLabel"] != "Domain" 
                    if a["comments"]
                        "#{a["description"]};" + " #{a["comments"][0]}"
                    else
                        a["description"]
                    end
                end
            end
        end.flatten.compact
    end
    # def self.get_standards_hash(standards, subject)
    #     binding.pry
    #     standards.collect do |id|
    #         id.collect do |a|
    #             if a["statementNotation"] && !a["statementNotation"].include?("CC")
    #                 section = Section.find_by_notation(a["statementNotation"], subject)
    #                 if section
    #                     if a["comments"]
    #                         comments = a["comments"].join
    #                     else
    #                         comments = ""
    #                     end
    #                     {
    #                         :description => a["description"] + comments,
    #                         :section_id => section.id,
    #                         :dot_notation => a["statementNotation"],
    #                         :subject_id => section.subject_id
    #                     }
    #                 end
    #             end
    #         end
    #     end.flatten.compact
    # end
    
    # def self.open_webpage(url)
    #     Nokogiri::HTML(open(url))
    # end

    # def self.get_standards_hash(url)
    #     doc = open_webpage(url)
    #     a1 = doc.css("div.standard").collect do |s|
    #         s_size = s.children.size
    #         { 
    #         :dot_notation => s.children[0].text,
    #         :standard => s.children[1..s_size].text 
    #         }
    #     end
    #     a2 = doc.css("div.substandard").collect do |ss|
    #         ss_size = ss.children.size
    #         {
    #         :dot_notation => ss.children[0].text,
    #         :standard => ss.children[1..ss_size].text 
    #         }
    #     end
    #     (a1 << a2).flatten!
    # end
    
end