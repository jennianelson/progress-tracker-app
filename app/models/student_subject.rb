class StudentSubject < ApplicationRecord
    belongs_to :user 
    belongs_to :subject
    has_many :student_standards
    validates :subject_id, uniqueness: {message: "has already been added"}

    def student_subject_sections
        self.subject.sections
    end

end
