class Accessory < ApplicationRecord
  validates_presence_of :title, :price, :image
  validates_uniqueness_of :title
  validates_numericality_of :price, greater_than: 0

  has_many :order_accessories
  has_many :orders, through: :order_accessories

  def order_quantity(order)
    order_accessories
    .where("order_accessories.order_id = #{order.id}")
    .take
    .quantity
  end

  def order_subtotal(order)
    price * order_quantity(order)
  end
end
