class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :index
      t.references :item, foreign_key: true
      t.references :material, foreign_key: true
      t.float :quantity

      t.timestamps
    end
  end
end
