class Skill < ApplicationRecord
    belongs_to :section
    validates :description, presence: true
end
