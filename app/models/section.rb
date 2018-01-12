class Section < ApplicationRecord
    belongs_to :subject
    has_many :skills

    validates :title, presence: true
end
