class AddBuildingsTable < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :building_type
      t.integer :zipcode
      t.decimal :lat
      t.decimal :long
      t.decimal :kwh

      t.timestamps
    end
  end

end
