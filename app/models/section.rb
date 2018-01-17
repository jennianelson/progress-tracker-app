class Section < ApplicationRecord
    belongs_to :subject
    has_many :skills, dependent: :destroy

    validates :title, presence: true
end
