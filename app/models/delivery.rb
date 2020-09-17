class Delivery < ApplicationRecord
  belongs_to :purchase
  belongs_to_active_hash :area

  with_options presence: true do
    validates :postal_cord, format:{with: /\A\d{3}[-]\d{4}\z/ }
    validates :city
    validates :address
    validates :building_name
    validates :phone_number, format:{with:/\A\d{10,11}\z/}
    validates :area_id
    validates :purchase_id
  end

  validates :area_id, numericality: { other_than: 1 }
end


