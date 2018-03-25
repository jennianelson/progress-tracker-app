class Standard < ApplicationRecord
    belongs_to :section
    belongs_to :subject

    has_many :student_standards, dependent: :destroy
    has_many :users, through: :student_standards
   
    validates :description, :dot_notation, :asn_id, presence: true

    def self.collect_descriptions
        all.map {|s| s.description}
    end

    def self.build_new_standards(array)
        array.map do |standard_hash|
            self.new(description: standard_hash[:description], asn_id: standard_hash[:asn_id], dot_notation: standard_hash[:dot_notation])
        end.sort_by {|s| s.asn_id }
    end

end