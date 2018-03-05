class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy
    accepts_nested_attributes_for :standards
    validates :title, presence: true

    def standards_attributes=(standards_attributes)
        standards_attributes.each do |i, standards_hash|
            if standards_hash[:description].present?
                self.standards.create(standards_hash)
            end
        end
    end
    # def self.find_by_notation(statementNotation, subject)
    #     all.find { |s| s.subject_id == subject.id && statementNotation.include?(s.abbreviation) }
    # end
end