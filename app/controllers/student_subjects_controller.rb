class StudentSubjectsController < ApplicationController
    
    def new
        @student_subject = StudentSubject.new
        @subjects = Subject.all
    end

    def create
        # binding.pry
        @student_subject = current_user.student_subjects.build(student_subject_params)
        if @student_subject.save
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def student_subject_params
        params.require(:student_subject).permit(:subject_id)
    end
end
