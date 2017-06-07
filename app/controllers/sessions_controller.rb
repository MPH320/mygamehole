class SessionsController < ApplicationController
    def new
    end
 
  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      
      if user.email_confirmed
        create_session(user)
        flash[:notice] = "Welcome, #{user.username}!"
        redirect_to root_path
      else
        flash.now[:alert] = 'Please activate your account by following the 
        instructions in the account confirmation email you received to proceed'
        render :new
      end
      
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end
 
  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end
end
