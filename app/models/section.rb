class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy

    validates :title, presence: true
    validates :abbreviation, format: { with: /[A-Z]{1,2}/,
        message: "should be one or two capital letters" }

    def self.find_by_notation(statementNotation, subject)
        all.find { |s| s.subject_id == subject.id && statementNotation.include?(s.abbreviation) }
    end
end