require './app/data_mapper_setup.rb'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  property :id,         Serial
  property :email,      String
  property :password_digest,   Text



  def password=(password)
    #@password =
    self.password_digest = BCrypt::Password.create(password)
  end

end
