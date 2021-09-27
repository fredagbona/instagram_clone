class SessionsController < ApplicationController

    skip_before_action :login_required, only: [:new, :create]
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        redirect_to user_path(user.id)
      else 
        flash.now[:danger] = 'Je n''ai pas réussi à me conecter'
        render :new 
      end
    end
  
    def destroy
      session.delete(:user_id)
      flash[:notice] = " Déconnecté"
      redirect_to new_session_path
    end
    
  

end
