module SectionsHelper
    def find_section(statementNotation)
        section = Section.all.find { |s| statementNotation.include?(s.abbreviation) if s.abbreviation}
    end
end
