class StudentSubjectsController < ApplicationController
    
    def index
        if !current_user.student?
            redirect_to subjects_path
        end
        @subjects = Subject.find_subjects_with_standards
        @student_subject = StudentSubject.new
    end

    def show
        @student_subject = StudentSubject.find(params[:id])
        authorize @student_subject
    end

    def create
        @subject = Subject.find(student_subject_params[:subject_id])
        @student_subject = current_user.student_subjects.build(student_subject_params)
        if @student_subject.save
            current_user.standards << @subject.standards
            redirect_to root_path
        else
            render :index
        end
    end
    
    # def destroy
    #     student_subject = StudentSubject.find(params[:id])
    #     sections = student_subject.student_subject_sections
    #     current_user.destroy_student_standards(sections)
    #     student_subject.destroy
    #     redirect_to root_path
    # end

    private

    def student_subject_params
        params.require(:student_subject).permit(:subject_id)
    end
end
