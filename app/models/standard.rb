class Standard < ApplicationRecord
    belongs_to :section
    belongs_to :subject

    has_many :student_standards, dependent: :destroy
    has_many :users, through: :student_standards
   
    validates :description, :dot_notation, presence: true

    def standards_attributes=(standards_attributes)
        standards_attributes.each do |i, standard_hash|
            if !standard_hash["include"]
                Standard.create(standard_hash)
            end
        end
    end

    def self.filter_by_section(section_id)
        where('section_id = ?', section_id)
    end

    def self.filter_by_subject(subject_id)
        where('subject_id = ?', subject_id)
    end

    def self.sort_by_subject_and_notation
        order(:subject_id, :dot_notation)
    end

    # def self.build_new_standards(model, array_of_standards)
    #     array_of_standards.map do |standard_hash|
    #         model.standards.build(description: standard_hash[:description], asn_id: standard_hash[:asn_id], dot_notation: standard_hash[:dot_notation])
    #     end
    # end

end