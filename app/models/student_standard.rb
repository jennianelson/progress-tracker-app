class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :user
    # helper_method :subheading, :description
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]

    def section
        self.standard.section
    end

    def description
        self.standard.description
    end

    def dot_notation
        self.standard.dot_notation
    end

    def subheading
        self.standard.subheading
    end

    def self.sort_collection(collection)
        binding.pry
    end
end