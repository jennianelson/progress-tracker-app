class StudentSubject < ApplicationRecord
    belongs_to :user 
    belongs_to :subject

def student_subject_sections
    self.subject.sections
end

end
