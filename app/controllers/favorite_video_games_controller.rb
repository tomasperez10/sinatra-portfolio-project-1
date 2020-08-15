class FavoriteVideoGamesController < ApplicationController

  get '/favoritevideogames' do
    @favoritevideogames = FavoriteVideoGames.all
    erb :'/favorite_video_games/index'

end
