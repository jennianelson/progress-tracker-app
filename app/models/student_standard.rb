class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :user
    # helper_method :subheading, :description
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]

    def self.sort_collection(collection)
        collection.sort_by {|ss| ss.dot_notation}
    end

    def ss_standard_section
        self.standard.section
    end

    def self.filter_by_section(section_id)
        self.select {|ss| ss.ss_standard_section.id == section_id}
    end

    def self.find_and_destroy(sections)
        
    end

#-----Should these BE HELPERS?-------#
    # def section
    #     self.standard.section
    # end

    # def description
    #     self.standard.description
    # end

    def dot_notation
        self.standard.dot_notation
    end

    # def subheading
    #     self.standard.subheading
    # end
#______

end