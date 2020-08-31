class User < ActiveRecord::Base
  has_many :favorite_video_games

  has_secure_password

  validates :username, :presence => true,
                       :uniqueness => true
  validates :password, :presence => true
end
