class StandardsController < ApplicationController

    def new
        @subject = Subject.find(params[:subject_id])
        @standards_array = get_standards_array(parse_api("standard_sets", @subject.set_id))
        @standard = Standard.new
        @sections = @subject.sections
    end

    def create
        @subject = Subject.find(standard_params["standards_attributes"]["0"]["subject_id"])
        @standard = Standard.new(standard_params)
        if @subject.standards.present?
            redirect_to subject_path(@subject)
        else
            redirect_to new_standard_path, alert: "Unable to add standards."
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
