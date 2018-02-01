class StudentSubjectsController < ApplicationController
    
    # def index
    #     @student_subjects = current_user.student_subjects
    # end

    # def show
    #     @student_subject = StudentSubject.find(params[:id])
    # end

    def new
        @student_subject = StudentSubject.new
    end

    def create
    @student_subject = current_user.student_subjects.build(student_subject_params)
        if @student_subject.save
            current_user.add_standards(@student_subject)
            redirect_to root_path
        else
            render :new
        end
    end
    
    def destroy
        student_subject = StudentSubject.find(params[:id])
        sections = student_subject.student_subject_sections
        current_user.destroy_student_standards(sections)
        student_subject.destroy
        redirect_to root_path
    end

    private

    def student_subject_params
        params.require(:student_subject).permit(:subject_id, :user_id)
    end
end
