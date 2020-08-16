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

end
