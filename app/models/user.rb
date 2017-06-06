class User < ActiveRecord::Base
   before_save { self.email = email.downcase if email.present? }
   
   after_create :send_confirmation_email
   

   validates :username, 
            length: { minimum: 1, maximum: 100 }, 
            presence: true,
            uniqueness: { case_sensitive: true }

   validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
   validates :password, length: { minimum: 6 }, allow_blank: true

   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }


   has_secure_password
   
   private
 
      def send_confirmation_email
       FavoriteMailer.new_user(self).deliver_now
     end
   end
