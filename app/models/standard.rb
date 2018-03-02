class Standard < ApplicationRecord
    belongs_to :section
    belongs_to :subject

    has_many :student_standards, dependent: :destroy
    has_many :users, through: :student_standards
   
    validates :description, presence: true

    def standards_attributes=(standards_attributes)
        standards_attributes.each do |i, standard_hash|
            if !standard_hash["include"]
                Standard.create(standard_hash)
            end
        end
    end

    def self.filter_by_section(section_id)
        where(section_id: section_id)
    end

    def self.filter_by_subject(subject_id)
        where(subject_id: subject_id)
    end

    def self.sort_by_subject_and_notation
        order(:subject_id, :dot_notation)
    end

    def self.filter_display(params)
        if !params["subjects"] || params["subjects"].empty?
            sort_by_subject_and_notation
        elsif
            !params["subjects"].empty?
            filter_by_subject(params["subjects"]).sort_by_subject_and_notation
        end
    end

    def self.get_standards_array(standards)
        standards.collect do |standard|
            standard.collect do |a|
                if a["description"] && a["statementLabel"] != "Disciplinary Core Idea" && a["statementLabel"] != "Domain" 
                    if a["comments"]
                        "#{a["description"]};" + " #{a["comments"][0]}"
                    else
                        a["description"]
                    end
                end
            end
        end.flatten.compact
    end

end