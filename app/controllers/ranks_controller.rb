class RanksController < ApplicationController

  def create
    @rank = Rank.new(rank_params)

    if @rank.save
      flash[:notice] = "#{@rank} has been saved"
    else
      flash[:notice] = @rank.errors
    end

    redirect_to root_path
  end

  private

  def rank_params
    params.require(:rank).permit(:thumb_ups, :thumb_downs, :person_id, :skill_id)
  end



end
