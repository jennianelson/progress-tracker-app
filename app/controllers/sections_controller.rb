class SectionsController < ApplicationController
    before_action :set_section

    def show
        student_standards = StudentStandard.filter_by_section(@section.id)
        @student_standards = StudentStandard.sort_by_dot_notation(student_standards)
        subject = @section.subject
        @student_subject = StudentSubject.find_by(subject_id: subject.id)
    end

    def edit
        @subject = @section.subject
        parsed_api = parse_api("standard_sets", @subject.set_id)
        standards = parsed_api["data"]["standards"].sort_by { |s| s[1]["asnIdentifier"]}
        standards_array = Standard.get_standards_array(standards)
        description_array = @subject.standards.map {|standard| standard.description}
        @standards = standards_array.select do |description|
            description_array.exclude?(description)
        end
        # binding.pry
        # @standards.each do |description|
        #     @section.standards.build(description: description)
        # end
    end

    def update
        binding.pry
        redirect_to edit_section_path(@section)
    end

    private
    
    def section_params
        params.require(:section).permit(standards_attributes: [:description, :dot_notation])
    end

    def set_section
        @section = Section.find(params[:id])
    end

end
