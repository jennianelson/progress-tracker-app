class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
        # @section = Section.new
    end

    def new
        @subject = Subject.new
        @sections = 4.times do
            @subject.sections.build
        end

    end

    def create
        binding.pry
        @subject = current_user.subjects.build(subject_params)
        if @subject.save
            redirect_to subject_path(@subject)
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
        params.require(:subject).permit(:title, sections_attributes: [:title])
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end
end
