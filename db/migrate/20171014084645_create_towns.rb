class CreateTowns < ActiveRecord::Migration
  def change
    create_table :towns do |t|
      t.string :Nom
      t.string :Latitude
      t.string :Longitude

      t.timestamps
    end
  end
end
