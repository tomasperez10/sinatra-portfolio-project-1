class FavoriteVideoGamesController < ApplicationController

  get '/favoritevideogames' do
    @favoritevideogames = FavoriteVideoGames.all
    erb :'/favorite_video_games/index'
  end

  post '/favoritevideogames' do
    FavoriteVideoGames.create(name: params[:name], user_id: session[:user_id])
    @favoritevideogames = FavoriteVideoGames.all

    erb :'/favorite_video_games/index'
  end

  get '/favoritevideogames/new' do
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
    @favoritevideogame.update(name: params[:name])

    redirect to "/favoritevideogames/#{@favoritevideogame.id}"
  end

  delete '/favoritevideogames/:id/delete' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])
    @favoritevideogame.delete

    redirect to '/favoritevideogames'
  end

end
