class SectionsController < ApplicationController
    before_action :set_section

    def show
        @student_subject = StudentSubject.find(params[:student_subject_id])
        @student_standards = @student_subject.student_standards.section(@section)
    end

    def edit
        @subject = @section.subject
        standards_array = get_standards_array(parse_api("standard_sets", @subject.set_id))
        #Chain some Standard scope methods
        @standards_not_added = Section.find_standards_not_added(standards_array, @subject)
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
        params.require(:section).permit(standards_attributes: [:description, :dot_notation, :subject_id, :asn_id])
    end

    def set_section
        @section = Section.find(params[:id])
    end

end
