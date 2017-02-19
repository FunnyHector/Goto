class MainController < ApplicationController

  def main
    render "main"
  end

  def find_best_person
    flash[:notice] = txt_from_answer  # FIXME Surely we can't just return the guy in notice
    redirect_to root_path
  end

  private

  def main_params
    params.require(:main).permit(:skill_1, :skill_2, :skill_3)
  end

  def skills_in_request
    [main_params[:skill_1], main_params[:skill_2], main_params[:skill_3]]
      .delete_if { |e| e.blank? || e.nil? }
      .map(&:downcase)
  end

  # only for beta version
  def txt_from_answer
    search_result = QueryForKeywords.new(skills_in_request).call
    answer = search_result.to_array  # Here we can decide what output we need

    "".tap do |str|
      if answer[0].present?
        people = answer[0].map(&:full_name).join(", ")
        skills = answer[1].map(&:title).join(", ")
        str << "Your first choice(s): #{people}. They know about: #{skills}."
      end

      if answer[2].present?
        people = answer[2].map(&:full_name).join(", ")
        skills = answer[3].map(&:title).join(", ")
        str << "\nYour second choice(s): #{people}. They know about: #{skills}."
      end

      if answer[4].present?
        people = answer[4].map(&:full_name).join(", ")
        skills = answer[5].map(&:title).join(", ")
        str << "\nYour third choice(s): #{people}. They know about: #{skills}."
      end

      str << "No results, maybe try another combination of keywords?" if str.blank?
    end
  end
end
