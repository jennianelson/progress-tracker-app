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
        @subject = Subject.new(subject_params)
        authorize @subject
        if @subject.save
            redirect_to new_subject_standard_path(@subject)
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

# <option value="B838B98D043045748F3814B9E43CAC85_D1000255_grade-06">Grade 6 Science (2005)</option>