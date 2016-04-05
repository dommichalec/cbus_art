# Piece class
class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.text :description
      t.string :medium
      t.string :size
      t.decimal :rental_price_per_day
      t.decimal :rental_price_per_week
      t.decimal :rental_price_per_month
      t.decimal :sale_price
      t.boolean :available?
      t.boolean :sold?

      t.timestamps null: false
    end
  end
end
