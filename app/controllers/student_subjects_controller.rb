class StudentSubjectsController < ApplicationController
    
    def index
        if current_user.admin?
            redirect_to subjects_path
        
        else 
            @subjects = Subject.ready
            @student_subjects = current_user.student_subjects
            @student_subject = StudentSubject.new
            respond_to do |f|
                f.html {render :index }
                f.json {render json: @student_subjects}
            end
        end
    end

    def show
        @student_subject = StudentSubject.find(params[:id])
        authorize @student_subject
        render json: @student_subject
    end

    def create
        if params[:student_subject][:subject_id].empty?
            redirect_to root_path
        else
            subject = Subject.find(student_subject_params[:subject_id])
            @student_subject = current_user.student_subjects.build(student_subject_params)
            if @student_subject.save
                @student_subject.create_student_standards(subject)
                # redirect_to student_subject_path(@student_subject)
                render json: @student_subject
            else
                render :index
            end
        end
    end
    
    def destroy
        student_subject = StudentSubject.find(params[:id])
        student_subject.destroy
        redirect_to user_path(student_subject.user)
    end

    private

    def student_subject_params
        params.require(:student_subject).permit(:subject_id)
    end
end
    