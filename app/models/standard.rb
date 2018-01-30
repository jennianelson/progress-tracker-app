class Standard < ApplicationRecord
    belongs_to :section
    has_many :student_standards
    has_many :users, through: :student_standards
   
    validates :description, presence: true

    def self.open_webpage(url)
        Nokogiri::HTML(open(url))
    end

    def self.get_standards_hash(url)
        doc = open_webpage(url)
        doc.css("section").collect do |section|
            section.css("h4").collect do |t|
                section.css("div.standard").collect do |s|
                    { 
                    :subheading => t.text.gsub(":", ""), 
                    :dot_notation => s.children[0].text,
                    :standard => s.children[2].text 
                    }
                end
            end
        end.flatten
    end
    
end
 # [a-zA-Z]+\s+(.)+
        # \d[A-Z]