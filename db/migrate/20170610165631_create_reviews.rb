class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.integer :rating
      t.references :game, index: true, foreign_key: true
      t.string :author

      t.timestamps null: false
    end
  end
end
