class AddJavascriptToGames < ActiveRecord::Migration
  def change
    add_column :games, :javascript, :string
  end
end
