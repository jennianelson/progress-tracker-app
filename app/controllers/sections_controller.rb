class SectionsController < ApplicationController
    def new
        # raise params.inspect
        if params[:subject_id] && !Subject.exists?(params[:subject_id])
            redirect_to subject_path, alert: "Subject not found."
        else
            @subject = Subject.find(params[:subject_id])
            @section = Section.new(subject_id: @subject.id)
        end
    end

    def create
        section = Section.new(section_params)
        if section.save
            redirect_to subject_path(section.subject)
        else
            render :new
        end
    end

    private
    def section_params
        params.require(:section).permit(:title, :subject_id)
    end
end
