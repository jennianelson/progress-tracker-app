class SectionsController < ApplicationController
    before_action :set_section, only: [:show, :edit, :update, :destroy]
    before_action :set_subject, only: [:new, :create, :update, :destroy]

    def new
        if params[:subject_id] && !Subject.exists?(params[:subject_id])
            redirect_to subject_path, alert: "Subject not found."
        else
            @section = @subject.sections.build
        end
    end

    def create
        @section = @subject.sections.build(section_params)
        if @section.save
            redirect_to section_path(@section)
        else
            render "new"
        end
    end

    def show
        @student_subject = StudentSubject.find(params[:student_subject_id])
        #--Need method or helper for this--
        student_standards = current_user.student_standards.find_all {|standard| standard.section == @section }
        @sorted_standards = StudentStandard.sort_collection(student_standards)
        # @subheadings = StudentStandard.collect_subheadings(@sorted_standards)
    end

    def edit
        if params[:subject_id] && !Subject.exists?(params[:subject_id])
            redirect_to section_path(@section), alert: "Associated subject not found."
        end
    end

    def update
        if @section.update(section_params)
            redirect_to section_path(@section)
        else
            render :edit
        end
    end

    def destroy
        @section.destroy
        redirect_to subject_path(@subject)
    end

    private

    def section_params
        params.require(:section).permit(:title)
    end

    def set_section
        @section = Section.find(params[:id])
    end

    def set_subject
        @subject = Subject.find(params[:subject_id])
    end
end
