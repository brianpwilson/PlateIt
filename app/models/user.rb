require 'digest/sha1'

class User < ActiveRecord::Base
  
  validates_presence_of     :name
  validates_uniqueness_of   :name
  
  attr_accessor   :password_confirmation
  validates_confirmation_of :password
  
  def validate
    errors.add_to_base("Missing password") if password.blank?
  end
  
  def password
    @password
  end
  
  def password=(pass)
   @password = pass
   create_salt
   self.hash_password = User.encrypt_password( self.password, self.salt ) 
  end
  
  def self.authenticate( name, password )
    user_to_find = self.find_by_name( name )
    
    if( user )
      expected_pass = encrypt_password( password, user.salt )
      if( user.hash_password != expected_pass )
        user = nil
      end
    end
    
    return user
  end
  
  private
  
  def create_salt
    self.salt = rand.to_s + rand.to_s + rand.to_s
  end
  
  def self.encrypt_password( password, salt )
    Digest::SHA1.hexdigest(password + "123" + salt)
  end
    
end
