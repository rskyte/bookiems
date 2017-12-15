ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'session'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    flash[:invalid_signin] = 'Email and/or password incorrect'
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/links'
    else
      redirect '/'
    end
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    user = User.create(email: params[:email], password: params[:password],
      password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id if user.valid?
    flash[:errors] = user.errors.values.flatten
    flash[:email] = user.email
    redirect(user.valid? ? '/links' : '/signup')
  end

  get '/links' do
    @user_name = current_user.email if !!current_user
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
