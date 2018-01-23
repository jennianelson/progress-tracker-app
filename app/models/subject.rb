class Subject < ApplicationRecord
    has_many :student_subjects
    has_many :users, through: :student_subjects
    
    has_many :sections, dependent: :destroy
    # accepts_nested_attributes_for :sections

    validates :title, presence: true

    def sections_attributes=(section_attributes)
        section_attributes.each do |i, section_hash|
            if section_hash[:title].present?
            section = Section.find_or_create_by(title: section_hash[:title])
                if !self.sections.include?(section)
                    self.sections << section
                end
            end
        end
    end

end