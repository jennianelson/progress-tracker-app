class SectionsController < ApplicationController
    # def new
    #     # binding.pry
    #     if params[:subject_id] && !Subject.exists?(params[:subject_id])
    #         redirect_to subject_path, alert: "Subject not found."
    #     else
    #         @subject = Subject.find(params[:subject_id])
    #         @section = Section.new(subject_id: @subject.id)
    #     end
    # end

    def create
        # binding.pry
        @subject = Subject.find(params[:subject_id])
        @section = @subject.sections.build(title: params[:section][:title])
        if @section.save
            redirect_to subject_path(@subject)
        else
            redirect_to subject_path(@subject), alert: "Title can't be blank!"
            # render "subjects/show" #can't get this to work--I want the field with errors!
        end
    end

    def show
        @section = Section.find(params[:id])
    end

    private
    def section_params
        params.require(:section).permit(:title, :subject_id)
    end
end
