class FavoriteMailer < ApplicationMailer
    default from: "michelangelo.ph@gmail.com"
    
    def new_user(user)
 
     @user = user
 
     mail(to: user.email, subject: "Thanks for signing up!")
   end
end
