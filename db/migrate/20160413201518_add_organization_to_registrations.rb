class AddOrganizationToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :organization, :string
  end
end
