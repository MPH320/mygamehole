class UsersController < ApplicationController
    
    def new
     @user = User.new
    end
    
    def edit
     @user = User.find(params[:id])
    end
    
    def update
     @user = User.find(params[:id])
     @user.username = params[:user][:username]
     @user.email = params[:user][:email]
     @user.password = params[:user][:password]
 
     if @user.save
       flash[:notice] = "Your details were updated."
       redirect_to @user
     else
       flash.now[:alert] = "There was an error saving the changes. Please try again."
       render :edit
     end
   end
    
    def show
     @user = User.find(params[:id])
    end
    
    def confirm
       @user = User.new
       @user.username = params[:user][:username]
       @user.email = params[:user][:email]
       @user.password = params[:user][:password]
       @user.password_confirmation = params[:user][:password_confirmation]
    end
    
    def create
    
        @user = User.new
        @user.username = params[:username]
        @user.email = params[:email]
        @user.password = params[:password]
        @user.password_confirmation = params[:password_confirmation]
 

     if @user.save
       flash[:notice] = "Please confirm your email address to continue"
       redirect_to root_url
     else
       flash.now[:alert] = "There was an error creating your account. Please try again."
       render :new
     end
   end
   
   def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:notice] = "Welcome to your game hole! Your email has been confirmed.
      Please sign in to continue."
      redirect_to new_session_path
    else
      flash[:alert] = "User info is incorrect."
      redirect_to root_url
    end
end
end
