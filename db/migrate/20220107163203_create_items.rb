class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.boolean :isMain
      t.integer :index
      t.references :project, foreign_key: true, on_delete: :cascade

      t.timestamps
    end
  end
end
