class Subject < ApplicationRecord
    has_many :sections, dependent: :destroy
    has_many :standards, dependent: :destroy
    
    has_many :student_subjects, dependent: :destroy
    has_many :users, through: :student_subjects

    validates :title, :sections, presence: true
    validates :set_id, presence: true, uniqueness: {message: "has already been added"}

    scope :ready, -> { where('ready = ?', true) }

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

    def standards_not_added(standards_array)
        description_array = self.standards.map {|standard| standard.description}
        standards_array.select do |standard_hash|
            description_array.exclude?(standard_hash[:description])
        end
    end

    def build_new_standards(array_from_api)
        array_from_api.map do |standard_hash|
            self.standards.build(description: standard_hash[:description], asn_id: standard_hash[:asn_id], dot_notation: standard_hash[:dot_notation])
        end
    end
    
    def self.not_added(subjects_array)
        set_ids = all.map {|subject| subject.set_id}
        subjects_array.select do |subject|
            set_ids.exclude?(subject[1])
        end
    end

    #Used in 
    # def self.find_subjects_with_standards
    #     joins(:standards).distinct
    # end

    #Used in
    # def self.find_subjects_without_standards
    #     includes(:standards).where(standards: {id: nil})
    # end

      #Used in
    # def self.filter_subject_display(params)
    #     if !params["subjects"] || params["subjects"].empty?
    #         sort_by_set_id
    #     elsif
    #         !params["subjects"].empty?
    #         find(params["subjects"])
    #     end
    # end

end