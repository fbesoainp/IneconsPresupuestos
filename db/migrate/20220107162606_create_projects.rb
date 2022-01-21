class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :location
      t.date :date
      t.float :utilitiesFactor
      t.float :materialsFactor
      t.float :workForceFactor
      t.float :generalExpensesFactor
      t.timestamps
    end
  end
end
