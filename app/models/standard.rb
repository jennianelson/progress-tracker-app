class Standard < ApplicationRecord
    belongs_to :section
    has_many :student_standards
    has_many :users, through: :student_standards
   
    validates :description, presence: true
    
end
