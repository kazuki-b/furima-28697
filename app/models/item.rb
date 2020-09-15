class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :area
  belongs_to_active_hash :postage
  belongs_to_active_hash :status
  belongs_to_active_hash :ship_date
  belongs_to             :user, optional: true
  has_one_attached       :image
  # has_one    :purcha

  with_options presence: true do
    validates :category_id
    validates :status_id
    validates :postage_id
    validates :area_id
    validates :ship_date_id
    validates :name
    validates :comment
    validates :price, inclusion: 300..9_999_999
    validates :image
    validates :user_id
  end

  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :area_id, numericality: { other_than: 1 }
  validates :postage_id, numericality: { other_than: 1 }
  validates :ship_date_id, numericality: { other_than: 1 }
end
