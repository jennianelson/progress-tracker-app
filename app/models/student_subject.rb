class StudentSubject < ApplicationRecord
    belongs_to :user 
    belongs_to :subject

    def sections
        self.subject.sections
    end
end
