require './app/data_mapper_setup.rb'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  property :id,         Serial
  property :email,      String, required: true, unique: true
  property :password_digest,   Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address

  def password_auth
    @password = BCrypt::Password.new(password_digest)
  end

  def password=(password)
    @password = BCrypt::Password.create(password)
    self.password_digest = @password
  end

end
