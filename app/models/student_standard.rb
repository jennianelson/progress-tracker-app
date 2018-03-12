class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :user
    belongs_to :student_subject
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]

    # def self.user_and_section(current_user, section)
    #     student_standards = self.where(user: current_user)
    #     student_standards.joins(:standard).where(standards: { section: section} ).order('standards.dot_notation')
    # end

    # def self.user(current_user)
    #     where(user: current_user)
    # end

    def self.section(section)
        joins(:standard).where(standards: { section: section} ).order('standards.dot_notation')
    end

end