class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :user
    belongs_to :student_subject
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]
    
    scope :has_progress_level, -> { where.not(progress_level: nil) }

    def self.filter_by_progress_level(progress_level)
        where(progress_level: progress_level)
    end

    def self.filter_by_section(section)
        joins(:standard).where(standards: { section: section} ).order('standards.dot_notation')
    end

end