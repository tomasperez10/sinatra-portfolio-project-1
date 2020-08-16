class CreateFavoriteVideoGames < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_video_games do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
