class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy

    validates :title, presence: true

    def self.find_by_notation(statementNotation, subject)
        all.find { |s| s.subject_id == subject.id && statementNotation.include?(s.abbreviation) }
    end
end