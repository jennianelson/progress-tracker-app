class StandardsController < ApplicationController
    require 'json'
    def index
        @subjects = Subject.find_subjects_with_standards
        @standards = Standard.filter_display(params)
    end

    def new
        @subject = Subject.find(params[:subject_id])
        parsed_api = parse_api("standard_sets", @subject.set_id)
        standards = parsed_api["data"]["standards"].sort_by { |s| s[1]["asnIdentifier"]}
        @standards_array = Standard.get_standards_array(standards)
        @standard = Standard.new
        @sections = @subject.sections
    end

    def create
        @subject = Subject.find(standard_params["standards_attributes"]["0"]["subject_id"])
        Standard.new(standard_params)
        if @subject.standards
            redirect_to subject_path(@subject)
        else
            redirect_to new_subject_standard_path(@subject)
        end
    end

    def edit
        @standard = Standard.find(params[:id])
    end

    def update
        @standard = Standard.find(params[:id])
        if @standard.update(standard_params)
            redirect_to section_path(@standard.section)
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def standard_params
        params.require(:standard).permit(standards_attributes: [:include, :description, :dot_notation, :section_id, :subject_id])
    end
end
