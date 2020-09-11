FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"kkk@gmail.com"}
    password              {"000000ss"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"1994-8-15"}
  end
end