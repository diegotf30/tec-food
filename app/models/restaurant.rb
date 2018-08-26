class Restaurant < ApplicationRecord
  has_many :products
  has_many :users, through: :purchases

  validates :name, length: { maximum: 50 }
end
