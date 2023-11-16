class CreateParcels < ActiveRecord::Migration[7.1]
  def change
    create_table :parcels do |t|
      t.string :city
      t.string :street
      t.string :house
      t.string :appartment
      t.string :addressee
      t.integer :value

      t.timestamps
    end
  end
end
