class StudentStandardsController < ApplicationController
    before_action :set_student_standard, only: [:show, :edit, :update]

    def index
        @student_subject = StudentSubject.find(params[:student_subject_id])
        @student_standards = @student_subject.student_standards.has_progress_level
        @student_standards = @student_standards.filter_by_progress_level(params[:progress_level]) if params[:progress_level].present?
    end
    
    def show
        authorize @student_standard
    end

    def edit
    end

    def update
        authorize @student_standard
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