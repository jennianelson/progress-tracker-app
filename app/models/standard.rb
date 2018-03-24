class Standard < ApplicationRecord
    belongs_to :section
    belongs_to :subject

    has_many :student_standards, dependent: :destroy
    has_many :users, through: :student_standards
   
    validates :description, :dot_notation, presence: true

    def self.filter_by_section(section_id)
        where('section_id = ?', section_id)
    end

    def self.filter_by_subject(subject_id)
        where('subject_id = ?', subject_id)
    end

    def self.sort_by_subject_and_notation
        order(:subject_id, :dot_notation)
    end

    def self.collect_descriptions
        all.map {|s| s.description}
    end

    def self.build_new_standards(array)
        array.map do |standard_hash|
            self.new(description: standard_hash[:description], asn_id: standard_hash[:asn_id], dot_notation: standard_hash[:dot_notation])
        end.sort_by {|s| s.asn_id }
    end

end