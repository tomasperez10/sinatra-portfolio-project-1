class FavoriteVideoGames < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true,
                      :uniqueness => true

  def self.authenticate(params)
    favorite_video_game = FavoriteVideoGames.find_by_name(params[:name]) && User.find_by_name(params[:username])
    (favorite_video_game && favorite_video_game.user_id == params[:user_id]) ? favorite_video_game : nil
  end
end
