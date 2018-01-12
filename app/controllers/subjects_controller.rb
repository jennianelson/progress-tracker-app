class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
        @subject = Subject.new
    end

    def create
        subject = current_user.subjects.build(subject_params)
        if subject.save
            redirect_to subject_path(subject)
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @subject.update(subject_params)
            redirect_to subject_path(@subject)
        else
            render :edit
        end
    end

    def destroy
        @subject.destroy
        redirect_to subjects_path
    end

    private

    def subject_params
        params.require(:subject).permit(:title)
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end
