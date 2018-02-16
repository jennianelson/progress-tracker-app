class StandardsController < ApplicationController
    require 'json'
    def index
        @subjects = Subject.find_subjects_with_standards
        @standards = Standard.filter_display(params)
    end

    def new
        @subject = Subject.find(params[:subject_id])
        parsed_api = parse_api("standard_sets", @subject.set_id)
        # binding.pry
        @standards = parsed_api["data"]["standards"].sort_by { |s| s[1]["asnIdentifier"]}
        # @subjects = Subject.find_subjects_without_standards
    end

    def create
        binding.pry
        subject = Subject.find(params[:subject_id])
        standards_hash = Standard.get_standards_hash(standards, subject)
        standards_hash.each do |hash|
            Standard.create(dot_notation: hash[:dot_notation], description: hash[:description], section_id: hash[:section_id], subject_id: subject.id)
        end
        redirect_to standards_path
    end

    def edit
        @standard = standard.find(params[:id])
    end

    def update
        @standard = standard.find(params[:id])
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
        params.require(:standard).permit(:description, :dot_notation, :subheading, :section_id)
    end
end
