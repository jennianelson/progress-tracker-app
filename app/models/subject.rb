class Subject < ApplicationRecord

    has_many :sections, dependent: :destroy
    has_many :standards, dependent: :destroy
    has_many :student_subjects, dependent: :destroy
    has_many :users, through: :student_subjects

    validates :title, :sections, presence: true
    validates :set_id, presence: true, uniqueness: {message: "has already been added"}

    scope :ready, -> { where('ready = ?', true) }

    def self.collect_set_ids
        all.map {|subject| subject.set_id}
    end
   
    def sections_attributes=(section_attributes)
        section_attributes.each do |i, section_hash|
            if section_hash[:id].present?
                if section_hash[:title].empty?
                    section = Section.find(section_hash[:id])
                    section.destroy
                else
                    section = Section.find(section_hash[:id])
                    section.title = section_hash[:title]
                    section.save
                end
            else
                if section_hash[:title].present?
                    section = Section.create(title: section_hash[:title])
                    self.sections << section
                end
            end
        end
    end

    def standards_attributes=(standards_attributes)
        standards_attributes.each do |i, standards_hash|
            if standards_hash[:description] != "0"
                self.standards.create(standards_hash)
            end
        end
    end

end