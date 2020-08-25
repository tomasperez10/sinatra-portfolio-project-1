class UsersController < ApplicationController

  get '/' do
    erb :'/users/index'
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    user = User.new(:username => params[:username], :password => params[:password])

    if user.save
      redirect "/login"
    else
      redirect "/failure"
    end
  end

  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/favoritevideogames"
    else
      redirect "/failure"
    end
  end

  get '/failure' do
    erb :'/users/failure'
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

end
