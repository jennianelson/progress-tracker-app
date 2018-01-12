class SectionsController < ApplicationController
    before_action :set_section, only: [:show, :edit, :update, :destroy]
    before_action :set_subject, only: [:new, :create, :edit, :update]

    def new
        if params[:subject_id] && !Subject.exists?(params[:subject_id])
            redirect_to subject_path, alert: "Subject not found."
        else
            @section = Section.new(subject_id: @subject.id)
        end
    end

    def create
        @section = @subject.sections.build(section_params)
        if @section.save
            redirect_to subject_path(@subject)
        else
            render "new"
        end
    end

    def show
        # binding.pry
        @skill = @section.skills.build
        @skills = @section.skills unless @section.skills.empty?
    end

    def edit
        if params[:subject_id] && !Subject.exists?(params[:subject_id])
            redirect_to subject_path, alert: "Subject not found."
        end
    end

    def update
        if @section.update(section_params)
            redirect_to section_path(@section)
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def section_params
        params.require(:section).permit(:title)
    end

    def set_section
        @section = Section.find(params[:id])
    end

    def set_subject
        @subject = Subject.find(params[:subject_id])
    end
end
