class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy
    validates :title, presence: true
    scope :persisted, -> { where "id IS NOT NULL" }

    def standards_attributes=(standards_attributes)
        standards_attributes.each do |i, standards_hash|
            if standards_hash[:description] != "0"
                self.standards.create(standards_hash)
            end
        end
    end

end