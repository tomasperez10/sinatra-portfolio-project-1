class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
    set :views, Proc.new { File.join(root, "../views/") }
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id]) if session[:user_id]
    end
  end
end
