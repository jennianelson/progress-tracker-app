class StudentStandardsController < ApplicationController
    def new
        @standard = Standard.find(params[:standard_id])
        @student_standard = @standard.student_standards.build
    end

    def create
        # binding.pry
        student_standard = current_user.student_standards.build(student_standard_params)
        # @student_standard = StudentStandard.new(student_standard_params)
        # @student_standard.user = current_user
        
        if student_standard.save
            redirect_to section_path(student_standard.section)
        else
            render :new
        end
    end

    private 
    
    def student_standard_params
        params.require(:student_standard).permit(:progress_level, :comments, :evidence, :standard_id)
    end
end