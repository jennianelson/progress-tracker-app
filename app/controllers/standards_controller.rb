class StandardsController < ApplicationController
  
    # def index
    #     @subjects = Subject.find_subjects_with_standards
    #     @standards = Standard.filter_display(params)
    # end

    def new
        @subject = Subject.find(params[:subject_id])
        @standards_array = get_standards_array(parse_api("standard_sets", @subject.set_id))
        @standard = Standard.new
        @sections = @subject.sections
    end

    def create
        @subject = Subject.find(standard_params["standards_attributes"]["0"]["subject_id"])
        Standard.new(standard_params)
        if @subject.standards.present?
            redirect_to subject_path(@subject)
        else
            render :new
        end
    end

    def edit
        @standard = Standard.find(params[:id])
        @subject = @standard.subject
    end

    def update
        @standard = Standard.find(params[:id])
        if @standard.update(standard_params)
            redirect_to subject_path(@standard.subject)
        else
            render :edit
        end
    end

    def destroy
        @standard = Standard.find(params[:id])
        @standard.destroy
        redirect_to subject_path(@standard.subject)
    end

    private

    def standard_params
        params.require(:standard).permit(:description, :dot_notation, :section_id, :asn_id, standards_attributes: [:include, :description, :dot_notation, :section_id, :subject_id, :asn_id])
    end
end
