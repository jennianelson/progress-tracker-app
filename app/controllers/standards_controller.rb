class StandardsController < ApplicationController

    def index
        @section = Section.find(params[:section_id])
        @standards = Standard.filter_by_section(params[:section_id])
    end

    def create
        @section = Section.find(params[:section_id])
        @standards_hash = Standard.get_standards_hash("http://www.corestandards.org/ELA-Literacy/RL/7/")
        @standards_hash.each do |hash|
            Standard.create(dot_notation: hash[:dot_notation], description: hash[:standard], section_id: params[:section_id])
        end
        redirect_to section_standards_path(@section)
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
