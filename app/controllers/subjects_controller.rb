class SubjectsController < ApplicationController
    def index
    end

    def show
        @subject = Subject.find(params[:id])
    end

    def new
        @subject = Subject.new
    end

    def create
        subject = current_user.subjects.build(subject_params)
        subject.save
        redirect_to root_path
    end

    private

    def subject_params
        params.require(:subject).permit(:title)
    end
end
