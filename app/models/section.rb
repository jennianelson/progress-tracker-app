class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy

    validates :title, presence: true

    def self.find_by_notation(statementNotation)
        binding.pry
        # all.find { |s| statementNotation.include?(s.abbreviation) if s.abbreviation}
        # self.find_by(abbreviation: )
    end
end
