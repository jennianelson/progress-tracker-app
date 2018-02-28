class Subject < ApplicationRecord
    has_many :sections, dependent: :destroy
    accepts_nested_attributes_for :sections, allow_destroy: true
    has_many :standards
    
    has_many :student_subjects, dependent: :destroy
    has_many :users, through: :student_subjects

    validates :title, presence: true
    validates :set_id, presence: true, uniqueness: {message: "has already been added"}

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

    def self.filter_subject_display(params)
        if !params["subjects"] || params["subjects"].empty?
            sort_by_set_id
        elsif
            !params["subjects"].empty?
            find(params["subjects"])
        end
    end

    def self.sort_by_set_id
        order(:set_id)
    end

    def self.find_subjects_with_standards
        joins(:standards).distinct
    end

    def self.find_subjects_without_standards
        includes(:standards).where(standards: {id: nil})
    end

end