require './app/data_mapper_setup.rb'

#DataMapper::Logger.new($stdout, :debug)

class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id,         Serial
  property :title,      String
  property :url,        String
end
