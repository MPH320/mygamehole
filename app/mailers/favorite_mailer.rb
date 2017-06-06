class FavoriteMailer < ApplicationMailer
    default from: "michelangelo.ph@gmail.com"
    
    def new_user(user)
 
     @user = user
 
     mail(to: "#{user.username} <#{user.email}>", subject: "Please confirm your new account.")
   end
end
