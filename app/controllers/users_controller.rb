class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :new
    end
  end 

  private

  def user_params
    params.require(:user).permit(
      :name, 
      :last_name,
      :email, 
      :password, 
      :password_confirmation
      )
  end  

end
