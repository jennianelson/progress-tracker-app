class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy

    validates :title, presence: true

    def self.find_by_notation(statementNotation)
        all.find { |s| statementNotation.include?(s.abbreviation) if s.abbreviation}
    end
end