FactoryBot.define do
  factory :purchase do
    association :item
    association :user
    item_id       { '1' }
    user_id       { '1' }
  end
end
