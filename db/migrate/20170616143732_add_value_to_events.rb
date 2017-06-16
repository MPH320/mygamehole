class AddValueToEvents < ActiveRecord::Migration
  def change
    add_column :events, :value, :integer
  end
end
