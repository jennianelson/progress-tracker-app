# CUD for Subjects will be available to Admin only

class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
        @subjects = Subject.all
        @user_subjects = current_user.subjects
        authorize Subject
        
        #Should all of this go in student_subject#create?
        if params[:subjects]
            user_subject = Subject.find_by(set_id: params[:subjects])
            if user_subject
                current_user.add_subject_and_standards(user_subject)
                render :index
            else
                render :index, alert: "Subject not found"
            end
        end
    end

    def show
    end

    def new
        @subject = Subject.new
    end

    def create
        authorize Subject
    end

    # def edit
    # end

    # def update
    #     if @subject.update(subject_params)
    #         redirect_to subject_path(@subject)
    #     else
    #         render :edit
    #     end
    # end

    # def destroy
    #     student_subject = current_user.student_subjects.find {|ss| ss.subject == @subject}
    #     # StudentStandard.find_and_destroy(@subject.sections)
    #     student_subject.destroy
    #     redirect_to subjects_path
    # end

    private

    def subject_params
        params.require(:subject).permit(:title, :set_id, sections_attributes: [:title])
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end
