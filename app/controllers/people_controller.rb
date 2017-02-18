class PeopleController < ApplicationController


  def create
    @person = Person.new(person_params)

    if @person.save
      flash[:notice] = "#{@person.full_name} has been saved"
    else
      flash[:notice] = @person.errors
    end

    redirect_to root_path
  end


  private

  def person_params
    params.require(:person).permit(:f_name, :l_name, :nick_name, :team, :title, :location, :email, :slack, :mobile)
  end


end
