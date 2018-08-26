class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant

  validates :name, length: { maximum: 50 }

  def products
    Product.where(id: purchased_product_ids)
  end
end
