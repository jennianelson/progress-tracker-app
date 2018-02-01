class StudentSubject < ApplicationRecord
    belongs_to :user 
    belongs_to :subject
    validates :user_id, uniqueness: {message: "have already added this subject"}

    def student_subject_sections
        self.subject.sections
    end

end
