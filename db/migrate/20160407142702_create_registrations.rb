class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :name
      t.string :email
      t.integer :phone_number, :limit => 10
      t.text :message
      t.boolean :interested_in_rental
      t.boolean :interested_in_purchase
      t.references :piece, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
