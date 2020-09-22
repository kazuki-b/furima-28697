class PurchaseDelivery

  include ActiveModel::Model
  attr_accessor :postal_cord, :area_id, :city, :address, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates  :item_id
    validates  :user_id
    validates  :token
    # 配送に関するバリデーション
    validates :postal_cord, format:{with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, format:{with:/\A\d{10,11}\z/}
    validates :area_id
  end
    #都道府県に関するバリデーション
  validates :area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(item_id:item_id,user_id:user_id)
    Delivery.create(postal_cord:postal_cord, area_id:area_id,city:city,address:address,building_name:building_name,phone_number:phone_number,purchase_id:purchase.id)
  end
end
