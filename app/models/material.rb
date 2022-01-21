class Material < ApplicationRecord
  has_many :subitems, through: :links
  validates :name, presence:true
  validates :price, presence:true
  validates :unity, presence:true
  validates :code, presence:true, uniqueness: true
  has_many :expense, dependent: :destroy


end
