class SectionsController < ApplicationController
    before_action :set_section, only: [:show, :edit, :update, :destroy]

    # def new
    # end

    # def create
    #     @section = @subject.sections.build(section_params)
    #     if @section.save
    #         redirect_to section_path(@section)
    #     else
    #         render "new"
    #     end
    # end

    def show
        student_standards = StudentStandard.filter_by_section(@section.id)
        @student_standards = StudentStandard.sort_by_dot_notation(student_standards)
        subject = @section.subject
        @student_subject = StudentSubject.find_by(subject_id: subject.id)
    end

    # def edit
    #     if params[:subject_id] && !Subject.exists?(params[:subject_id])
    #         redirect_to section_path(@section), alert: "Associated subject not found."
    #     end
    # end

    # def update
    #     if @section.update(section_params)
    #         redirect_to section_path(@section)
    #     else
    #         render :edit
    #     end
    # end

    # def destroy
    #     @section.destroy
    #     redirect_to subject_path(@subject)
    # end

    private

    # def section_params
    #     params.require(:section).permit(:title)
    # end

    def set_section
        @section = Section.find(params[:id])
    end

    # def set_subject
    #     @subject = Subject.find(params[:subject_id])
    # end
end
