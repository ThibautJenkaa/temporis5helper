class UsersController < ApplicationController
  before_action :is_admin?, only: [:new, :create]

  def new
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Utilisateur bien créé"
      redirect_to root_path 
    else
      render :new
    end
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end