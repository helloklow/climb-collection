require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "clb-coll"
  end

  get "/" do
    if logged_in?
      erb :'/climbs/climbs'
    else
      erb :index
    end
  end

  helpers do
    def current_user
      User.find_by(id: session[:user_id])
    end

    def logged_in?
      !!current_user
    end
  end

end