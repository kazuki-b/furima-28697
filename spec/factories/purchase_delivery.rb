FactoryBot.define do
  factory :purchase_delivery do
    token           { 'tok_hogefuga1234' }
    postal_cord     { '123-4567' }
    area_id         { '2' }
    address         { '町' }
    city            { '市' }
    building_name   { '1-1' }
    phone_number    { '09099991111' }
    item_id       { '1' }
    user_id       { '1' }
  end
end