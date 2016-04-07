class AddNeighborhoodToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :neighborhood, :string
  end
end
