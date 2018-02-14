class StudentSubject < ApplicationRecord
    belongs_to :user 
    belongs_to :subject
    # validates :subject_id, uniqueness: {message: "has already been added"}
    validates_uniqueness_of :subject_id, :scope => :user_id

end
