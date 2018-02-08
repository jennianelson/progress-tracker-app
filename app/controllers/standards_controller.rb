class StandardsController < ApplicationController
    require 'json'
    def index
        @subjects = Subject.subjects_with_standards
        @standards = Standard.filter_display(params)
    end

    def new
        @subjects = Subject.all
    end

    def create
        standards = parse_api(params[:subjects])
        @standards = standards["data"]["standards"].sort 
        standards_hash = Standard.get_standards_hash(@standards)
        binding.pry
        standards_hash.each do |hash|
            Standard.create(dot_notation: hash[:dot_notation], description: hash[:description], section_id: hash[:section_id], subject_id: hash[:subject_id])
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
