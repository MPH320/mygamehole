module SessionsHelper
    def create_session(user)
     session[:user_id] = user.id
   end
 
   def destroy_session(user)
     session[:user_id] = nil
   end
 
   def current_user
     User.find_by(id: session[:user_id])
   end
   
   def authorized_game_edit(game)
        if game.user_id == session[:user_id]
            return true
        else 
            return false
        end 
   end
   
   def authorized_profile_edit(user)
        if user.id == session[:user_id]
            return true
        else 
            return false
        end 
   end
   
    def myGames(user)
        Game.where(:user_id => user.id).all
    end
end
