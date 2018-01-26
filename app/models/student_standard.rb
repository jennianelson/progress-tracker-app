class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :user
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]

    def section
        self.standard.section
    end

    def description
        self.standard.description
    end
end