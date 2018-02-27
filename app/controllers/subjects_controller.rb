class SubjectsController < ApplicationController
    before_action :set_subject, only: [:show, :edit, :update, :destroy]

    def index
        @subjects = Subject.all.sort_by { |s| s.set_id }
    end

    def show
    end

    def new
        @subject = Subject.new
        authorize @subject
        5.times { @subject.sections.build } 
    end

    def create
        @subject = Subject.new(subject_params)
        authorize @subject
        if @subject.save
            redirect_to new_subject_standard_path(@subject)
        else
            render :new
        end
    end

    def edit
        authorize @subject
    end

    def update
        authorize @subject
        if @subject.update(subject_params)
            redirect_to subject_path(@subject)
        else
            render :edit
        end
    end

    def destroy
        authorize @subject
        @subject.destroy
        redirect_to subjects_path
    end

    private

    def subject_params
        params.require(:subject).permit(:title, :set_id, sections_attributes: [:title, :abbreviation])
    end

    def set_subject
        @subject = Subject.find(params[:id])
    end

end