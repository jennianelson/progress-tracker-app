class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :user
    # helper_method :subheading, :description
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]

    def self.sort_by_dot_notation(collection)
        collection.sort_by {|ss| ss.standard.dot_notation}
    end

    def ss_standard_section
        self.standard.section
    end

    def self.filter_by_section(section_id)
        joins(:standard).where(standards: { section: section_id })
    end

    # def dot_notation
    #     self.standard.dot_notation
    # end

end