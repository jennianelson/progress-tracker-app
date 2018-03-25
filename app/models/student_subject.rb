class StudentSubject < ApplicationRecord
    belongs_to :user 
    belongs_to :subject
    has_many :student_standards, dependent: :destroy
    
    validates_uniqueness_of :subject_id, :scope => :user_id, :message => "has already been added"

    def create_student_standards(subject)
        current_user = self.user
        subject.standards.each do |standard|
            current_user.student_standards.create(standard_id: standard.id, student_subject_id: self.id)
        end
    end
end
