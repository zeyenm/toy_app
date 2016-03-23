class User < ActiveRecord::Base
    before_save { self.email = email.downcase }     #make all email addresses downcase before saving in the db
    validates :name, presence: true, length: {maximum: 50}      #name should not be longer than 50 characters
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end
