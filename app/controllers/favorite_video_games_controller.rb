class FavoriteVideoGamesController < ApplicationController

  get '/favoritevideogames' do
    @favoritevideogames = FavoriteVideoGames.all
    # @users = User.all
    if current_user
      erb :'/favorite_video_games/index'
    else
      redirect to "/login"
    end
  end

  post '/favoritevideogames' do
    #@user = user
    @favoritevideogame = FavoriteVideoGames.create(name: params[:name], user_id: session[:user_id])
    @favoritevideogames = FavoriteVideoGames.all

    # @users = User.all
    #@user = User.find(:id => params[:id])

    # if !params["user_id"]["name"].empty?
    #   @favoritevideogame.user = User.create(name: params["user_id"]["name"])
    # end
    # @favoritevideogame.save
    # redirect to "/favoritevideogames/#{@favoritevideogame.id}"

    erb :'/favorite_video_games/index'
  end

  get '/favoritevideogames/new' do
    # @users = User.all

    if current_user
      erb :'/favorite_video_games/new'
    else
      redirect to "/login"
    end


    #erb :'/favorite_video_games/new'
  end

  get '/favoritevideogames/:id' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])

    if current_user == @favoritevideogame.user
      erb :'/favorite_video_games/show'
    else
      redirect to "/login"
    end
  end

  get '/favoritevideogames/:id/edit' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])

    if current_user == @favoritevideogame.user
      erb :'/favorite_video_games/edit'
    else
      redirect to "/login"
    end
  end

  patch '/favoritevideogames/:id' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])
    #@user = User.find(:id => params[:id])


    if current_user == @favoritevideogame.user
      @favoritevideogame.update(name: params[:name])
      redirect to "/favoritevideogames/#{@favoritevideogame.id}"
    else
      redirect to "/favoritevideogames"
    end

    # if !params["user_id"]["name"].empty?
    #   @favoritevideogame.user = User.create(name: params["user_id"]["name"])
    # end
    # @favoritevideogame.save


  end

  delete '/favoritevideogames/:id/delete' do
    @favoritevideogame = FavoriteVideoGames.find(params[:id])
    #@user = User.find(:id => params[:id])


    if current_user == @favoritevideogame.user
      @favoritevideogame.delete
      redirect to '/favoritevideogames'
    else
      redirect to '/favoritevideogames'
    end
  end

end
