class FavoriteVideoGamesController < ApplicationController

  get '/favoritevideogames' do
    @favoritevideogames = FavoriteVideoGames.all
    @users = User.all
    erb :'/favorite_video_games/index'
  end

  post '/favoritevideogames' do
    #@user = user
    @favoritevideogame = FavoriteVideoGames.create(name: params[:name], user_id: session[:user_id])
    @favoritevideogames = FavoriteVideoGames.all

    @users = User.all
    #@user = User.find(:id => params[:id])

    # if !params["user_id"]["name"].empty?
    #   @favoritevideogame.user = User.create(name: params["user_id"]["name"])
    # end
    # @favoritevideogame.save
    # redirect to "/favoritevideogames/#{@favoritevideogame.id}"

    erb :'/favorite_video_games/index'
  end

  get '/favoritevideogames/new' do
    @users = User.all
    erb :'/favorite_video_games/new'
  end

  get '/favoritevideogames/:id' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])

    erb :'/favorite_video_games/show'
  end

  get '/favoritevideogames/:id/edit' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])

    erb :'/favorite_video_games/edit'
  end

  patch '/favoritevideogames/:id' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])
    #@user = User.find(:id => params[:id])
    @favoritevideogame.update(name: params[:name])

    unless current_user == @favoritevideogame.user
      redirect to "/favoritevideogames" and return
    end

    # if !params["user_id"]["name"].empty?
    #   @favoritevideogame.user = User.create(name: params["user_id"]["name"])
    # end
    # @favoritevideogame.save

    redirect to "/favoritevideogames/#{@favoritevideogame.id}"
  end

  delete '/favoritevideogames/:id/delete' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])
    #@user = User.find(:id => params[:id])
    @favoritevideogame.delete

    redirect to '/favoritevideogames'
  end

end
