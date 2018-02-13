class StudentSubject < ApplicationRecord
    belongs_to :user 
    belongs_to :subject
    validates :subject_id, uniqueness: {message: "has already been added"}

end
