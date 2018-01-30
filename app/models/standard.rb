class Standard < ApplicationRecord
    belongs_to :section
    has_many :student_standards
    has_many :users, through: :student_standards
   
    validates :description, presence: true

    def self.filter_by_section(section_id)
        # binding.pry
        where(section_id: section_id)
    end

    def self.open_webpage(url)
        Nokogiri::HTML(open(url))
    end

    def self.get_standards_hash(url)
        doc = open_webpage(url)
        doc.css("div.standard").collect do |s|
            { 
            :dot_notation => s.children[0].text,
            :standard => s.children[2].text 
            }
        end.flatten
    end
    
end
 # [a-zA-Z]+\s+(.)+
        # \d[A-Z]