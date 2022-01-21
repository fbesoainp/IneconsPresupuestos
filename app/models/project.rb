class Project < ApplicationRecord
    validates :name, presence:true
    validates :date, presence:true
    validates :location, presence:true
    validates :utilitiesFactor, presence:true
    validates :materialsFactor, presence:true
    validates :workForceFactor, presence:true
    validates :generalExpensesFactor, presence:true
    has_many :items, dependent: :destroy

end
