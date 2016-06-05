class User < ActiveRecord::Base

  def password=(password)
     self.password_digest = BCrypt::Password.create(password)
   end

   def is_password?(password)
     BCrypt::Password.new(self.password_digest) == password
   end

   def self.find_by_credentials(email, password)
    @user = User.find_by_email(email)
    return nil if @user.nil?
    digest = BCrypt::Password.new(@user.password_digest)
    digest.is_password?(password) ? @user : nil
  end

  def password=(password)
   @password = password
   self.password_digest = BCrypt::Password.create(password)
   self.save
 end

 def reset_session_token!
   self.session_token = SecureRandom::urlsafe_base64(16)
   self.save
 end

 def ensure_session_token
   self.session_token ||= SecureRandom::urlsafe_base64(16)
 end

end
