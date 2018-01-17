class SkillsController < ApplicationController

    def create
        # binding.pry
        @skill = Skill.new(skill_params)
        @section = @skill.section
        if @skill.save
            redirect_to section_path(@section)
        else
            render 'sections/show'
            #why does this go to /skills?
        end
    end

    def edit
        @skill = Skill.find(params[:id])
    end

    def update
        @skill = Skill.find(params[:id])
        if @skill.update(skill_params)
            redirect_to section_path(@skill.section)
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def skill_params
        params.require(:skill).permit(:description, :section_id)
    end
end
