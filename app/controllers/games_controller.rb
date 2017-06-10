class GamesController < ApplicationController
    
    def index
     @games = Game.all
   end
   
   def show
     @game = Game.find(params[:id])
   end
   
   def edit
     @game = Game.find(params[:id])
   end
   
   def update
     @game = Game.find(params[:id])
     @game.title = params[:game][:title]
     @game.description = params[:game][:description]
     @game.url = params[:game][:url]
 
     if @game.save
       flash[:notice] = "Game was updated."
       redirect_to @game
     else
       flash.now[:alert] = "There was an error saving the changes. Please try again."
       render :edit
     end
   end
   
   def destroy
     @game = Game.find(params[:id])
 
     if @game.destroy
       flash[:notice] = "\"#{@game.title}\" was deleted successfully."
       redirect_to games_path
     else
       flash.now[:alert] = "There was an error deleting the game."
       render :show
     end
   end
   
   def new
     @game = Game.new
   end  
   
   def create
     @game = Game.new
     @game.title = params[:game][:title]
     @game.description = params[:game][:description]
     @game.url = params[:game][:url]
     @game.user_id = session[:user_id]
     
     if @game.save
       redirect_to @game, notice: "Game was saved successfully."
     else
       flash.now[:alert] = "Error creating game. Please try again."
       render :new
     end
   end
end
