class FavoriteVideoGamesController < ApplicationController

  get '/favoritevideogames' do
    @favoritevideogames = FavoriteVideoGames.all
    erb :'/favorite_video_games/index'
  end

  post '/favoritevideogames' do
    FavoriteVideoGames.create(name: params[:name])
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

  get '/favorite_video_games/:id/edit' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])

    erb :'/favorite_video_games/edit'
  end

  patch '/favorite_video_games/:id' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])
    @favoritevideogame.update(name: params[:name])

    erb :'/favorite_video_games/show'
  end

  delete '/favorite_video_games/:id/delete' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])
    @favoritevideogame.delete

    erb :'/favorite_video_games/delete'
  end

end
