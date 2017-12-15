ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :index
  end

  get '/links/new' do
    erb :add_link
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    params[:tags].split(',').each { |tag| link.tags << Tag.first_or_create(name: tag) }
    link.save
    redirect to('/links')
  end

  get '/tag' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :tag_filter
  end

  get '/newtag' do
    erb :add_tag
  end

  post '/newtag' do
    tag = Tag.first_or_create(name: params[:tag])
    link = Link.first(title: params[:title])
    link.tags << tag
    link.save
    redirect '/links'
  end

  run! if app_file == $0
end
