class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :student
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]
end