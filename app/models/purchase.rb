class Purchase < ApplicationRecord
  has_one    :delivery
  belongs_to :item
  belongs_to :user

  # attr_accessor :token
  # with_options presence: true do
  #   validates  :item_id
  #   validates  :user_id
  # end
end
