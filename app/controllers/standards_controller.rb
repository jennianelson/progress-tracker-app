class StandardsController < ApplicationController

    def new
        @standards_hash = Standard.get_standards_hash("http://www.corestandards.org/ELA-Literacy/RL/7/")
        # binding.pry
        # @standard = Standard.new
    end

    def create
        @standard = Standard.new(standard_params)
        @section = @standard.section
        if @standard.save
            redirect_to section_path(@section)
        else
            render 'sections/show'
            #why does this go to /standards?
        end
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
        params.require(:standard).permit(:description, :section_id)
    end
end
