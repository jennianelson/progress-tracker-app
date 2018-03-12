class Section < ApplicationRecord
    belongs_to :subject
    has_many :standards, dependent: :destroy
    # accepts_nested_attributes_for :standards
    validates :title, presence: true

    def standards_attributes=(standards_attributes)
        standards_attributes.each do |i, standards_hash|
            if standards_hash[:description].present?
                self.standards.create(standards_hash)
            end
        end
    end

    #Try to use active record queries?
    def self.find_standards_not_added(standards_array, subject)
        description_array = subject.standards.map {|standard| standard.description}
        standards_array.select do |standard_hash|
            description_array.exclude?(standard_hash[:description])
        end
    end

end