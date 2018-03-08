class StudentStandardsController < ApplicationController
    # def new
    #     @standard = Standard.find(params[:standard_id])
    #     @student_standard = @standard.student_standards.build
    # end

    # def create
    #     student_standard = current_user.student_standards.build(student_standard_params)
    #     if student_standard.save
    #         redirect_to section_path(student_standard.section)
    #     else
    #         render :new
    #     end
    # end

    def show
        @section = Section.find(params[:section_id])
        @student_standard = StudentStandard.find(params[:id])
    end

    def edit
        @section = Section.find(params[:section_id])
        @student_standard = StudentStandard.find(params[:id])
    end

    def update
        @section = Section.find(params[:section_id])
        @student_standard = StudentStandard.find(params[:id])
        if @student_standard.update(student_standard_params)
            redirect_to section_student_standard_path(@section, @student_standard)
        else
            render "sections/edit"
        end
    end

    private 
    
    def student_standard_params
        params.require(:student_standard).permit(:progress_level, :comments, :evidence, :standard_id)
    end
end