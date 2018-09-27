class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.integer :position
      t.timestamps
    end
  end
end
