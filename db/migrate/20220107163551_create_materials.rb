class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :name
      t.string :code
      t.float :price
      t.string :unity
      t.string :description 
      t.string :category
      t.timestamps
    end
  end
end
