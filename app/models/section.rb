class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy

    validates :title, presence: true
end
