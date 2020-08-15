class User < ActiveRecord::Base
  has_many :favorite_video_games
end
