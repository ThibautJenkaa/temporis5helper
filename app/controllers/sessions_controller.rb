class SessionsController < ApplicationController
  def new

  end

  def create 
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password]) 
      session[:user_id] = user.id
      flash[:notice] = "Vous êtes maintenant connecté"
      redirect_to root_path
    else  
      flash.now[:alert] = "Mauvais identifiants"
      render :new
    end
  end

  def destroy 
    session[:user_id] = nil
    flash[:notice] = "Déconnexion effective"
    redirect_to root_path
  end

end