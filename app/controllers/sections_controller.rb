class SectionsController < ApplicationController
    before_action :set_section

    def show
        @student_subject = StudentSubject.find(params[:student_subject_id])
        @student_standards = @student_subject.student_standards.section(@section)
    end

    def edit
        @subject = @section.subject
        standards_array = get_standards_array(parse_api("standard_sets", @subject.set_id))
         #NEEDS WORK!
        @standards_not_added = standards_not_added(standards_array, @subject)
        @standards = @standards_not_added.map do |standard_hash|
            @section.standards.build(description: standard_hash[:description], asn_id: standard_hash[:asn_id])
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
        params.require(:section).permit(standards_attributes: [:description, :dot_notation, :subject_id, :asn_id])
    end

    def set_section
        @section = Section.find(params[:id])
    end

    def standards_not_added(standards_array, subject)
        description_array = subject.standards.map {|standard| standard.description}
        standards_array.select do |standard_hash|
            description_array.exclude?(standard_hash[:description])
        end
    end

end
