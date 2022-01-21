class Item < ApplicationRecord
  belongs_to :project
  belongs_to :item, optional: true
  has_many :items, dependent: :destroy
  has_many :expenses, dependent: :destroy
  validates :name, presence:true
end
