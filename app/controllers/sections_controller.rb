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
        standards_array = get_standards_array(parse_api("standard_sets", @subject.set_id))
        description_array = @subject.standards.map {|standard| standard.description}
        @standards_not_added = standards_array.select do |description|
            description_array.exclude?(description)
        end
    end

    def update
        @subject = @section.subject
        if @section.update(section_params)
            redirect_to subject_path(@subject)
        else
            render :edit
        end
    end

    private
    
    def section_params
        params.require(:section).permit(standards_attributes: [:description, :dot_notation, :subject_id])
    end

    def set_section
        @section = Section.find(params[:id])
    end

end
