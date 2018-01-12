class SkillsController < ApplicationController

    def create
        @skill = Skill.new(skill_params)
        @section = @skill.section
        if @skill.save
            redirect_to section_path(@section)
        else
            redirect_to section_path(@section), alert: "Skill cannot be blank."
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
