class ReviewsController < ApplicationController

  def create

     @game = Game.find(params[:game_id])
     review = @game.reviews.new(review_params)
     review.author = current_user.username
 
     if review.save
       flash[:notice] = "Review saved successfully."
       redirect_to @game
     else
       flash[:alert] = "Comment failed to save."
       redirect_to @game
     end
   end

  def edit
  end
  
  private
 
   def review_params
     params.require(:review).permit(:body, :title, :rating)
   end
end
