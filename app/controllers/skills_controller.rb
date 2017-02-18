class SkillsController < ApplicationController

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      flash[:notice] = "#{@skill.title} has been saved"
      else
        flash[:notice] = @skill.errors
    end

    redirect_to root_path
  end


  private

  def skill_params
    params.require(:skill).permit(:title, :description)
  end

end
