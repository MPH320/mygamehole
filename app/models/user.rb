class User < ActiveRecord::Base
   before_create :confirmation_token
   before_save { self.email = email.downcase if email.present? }
   has_many :games, dependent: :destroy
   
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
   
   def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
   end
   
   def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end
   
   private
 
      def send_confirmation_email
       FavoriteMailer.new_user(self).deliver_now
     end
     
     def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
   end
