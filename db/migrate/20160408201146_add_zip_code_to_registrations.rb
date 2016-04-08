class AddZipCodeToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :zip_code, :integer
  end
end
