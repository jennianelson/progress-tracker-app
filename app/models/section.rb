class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy
    # accepts_nested_attributes_for :standards
    validates :title, presence: true

    def standards_attributes=(standards_attributes)
        binding.pry
    end
    # def self.find_by_notation(statementNotation, subject)
    #     all.find { |s| s.subject_id == subject.id && statementNotation.include?(s.abbreviation) }
    # end
end