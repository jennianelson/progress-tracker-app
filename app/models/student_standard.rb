class StudentStandard < ApplicationRecord
    belongs_to :standard
    belongs_to :user
    # helper_method :subheading, :description
    
    enum progress_level: [:beginning, :progressing, :confused, :conquered]

#-----Should these BE HELPERS?-------#
    def section
        self.standard.section
    end

    def description
        self.standard.description
    end

    def dot_notation
        self.standard.dot_notation
    end

    def subheading
        self.standard.subheading
    end
#______

    def self.sort_collection(collection)
        collection.sort_by {|ss| ss.dot_notation}
    end

end