class AddContentToGames < ActiveRecord::Migration
  def change
    add_column :games, :content, :string
  end
end
