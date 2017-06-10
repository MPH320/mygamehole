module GamesHelper
    def findReviews(id)
        Review.where(:game_id => id).all
    end
    
    def authorized_reviewer(game)
     User.find_by(id: session[:user_id])
   end
   
   def authorized_reviewer(game)
        if game.user_id == session[:user_id]
            return false
        else 
            if Review.where(:author => current_user.username, :game_id => game.id).exists?
                return false
            else
                return true
            end
        end 
   end
end
