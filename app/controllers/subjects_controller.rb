class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
        @subjects = Subject.all
    end

    def show
    end

    def new
        @subject = Subject.new
        5.times { @subject.sections.build } 
    end

    def create
        # binding.pry
        @subject = Subject.new(subject_params)
        if @subject.save
            redirect_to subjects_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        authorize @subject
        if @subject.update(subject_params)
            redirect_to subject_path(@subject)
        else
            render :edit
        end
    end

    # def destroy
    #     student_subject = current_user.student_subjects.find {|ss| ss.subject == @subject}
    #     # StudentStandard.find_and_destroy(@subject.sections)
    #     student_subject.destroy
    #     redirect_to subjects_path
    # end

    private

    def subject_params
        params.require(:subject).permit(:title, :set_id, sections_attributes: [:title, :abbreviation])
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end