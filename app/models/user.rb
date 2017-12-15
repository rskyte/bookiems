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

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
