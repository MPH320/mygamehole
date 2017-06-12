class AddStyleToGames < ActiveRecord::Migration
  def change
    add_column :games, :style, :string
  end
end
