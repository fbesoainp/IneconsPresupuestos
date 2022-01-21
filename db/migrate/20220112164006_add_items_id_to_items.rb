class AddItemsIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :item, foreign_key: true, on_delete: :cascade
  end
end
