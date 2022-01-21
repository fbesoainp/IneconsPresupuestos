class Expense < ApplicationRecord
  validates :index, presence:true
  validates :quantity, presence:true

  belongs_to :item
  belongs_to :material

end
