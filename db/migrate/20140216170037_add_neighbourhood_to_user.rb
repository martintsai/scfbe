class AddNeighbourhoodToUser < ActiveRecord::Migration
  def change
    add_column :users, :neighbourhood, :string
  end
end
