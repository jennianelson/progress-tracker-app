class Standard < ApplicationRecord
    belongs_to :section
    belongs_to :subject

    has_many :student_standards, dependent: :destroy
    has_many :users, through: :student_standards
   
    validates :description, presence: true

    def self.filter_by_section(section_id)
        where(section_id: section_id)
    end

    def self.filter_and_sort(section_id)
        filter_by_section(section_id).sort_by { |standard| standard.dot_notation }
    end

    def self.get_section_id(attributes)
        Section.find_by_notation(attributes["statementNotation"])
    end

    def self.get_standards_hash(standards)
        standards.each do |id|
            id.each do |attributes|
                #not iterating over right key yet
                binding.pry
                section = get_section_id(attributes)
                if section
                    {
                        :description => attributes["description"],
                        :section_id => section.id,
                        :dot_notation => attributes["statementNotation"]
                    }
                end
            end
        end
    end
    
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