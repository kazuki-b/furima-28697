FactoryBot.define do
  factory :item do
    name         { '名前' }
    comment      { 'コメント' }
    price        { '500' }
    category_id  { '2' }
    status_id    { '2' }
    postage_id   { '2' }
    area_id      { '2' }
    ship_date_id { '2' }
    association :user
    user_id       { '1' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
