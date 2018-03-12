class StudentStandardsController < ApplicationController
    before_action :set_student_standard

    def show
    end

    def edit
    end

    def update
        if @student_standard.update(student_standard_params)
            redirect_to student_standard_path(@student_standard)
        else
            render "edit"
        end
    end

    private 
    
    def student_standard_params
        params.require(:student_standard).permit(:progress_level, :comments, :evidence, :standard_id)
    end

    def set_student_standard
        @student_standard = StudentStandard.find(params[:id])
    end
end