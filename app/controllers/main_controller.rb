class MainController < ApplicationController

  def main
    render "main"
  end

  def find_best_person
    person = Rank.best_person_for_skills(skills_in_request)
    flash[:notice] = "#{person.full_name} is the guy you're looking for"  # FIXME Surely we can't just return the guy in notice
    redirect_to root_path
  end

  private

  def main_params
    params.permit(:skill_1, :skill_2, :skill_3)
  end

  def skills_in_request
    [main_params[:skill_1], main_params[:skill_2], main_params[:skill_3]].compact
  end

end
