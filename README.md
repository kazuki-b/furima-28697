# README

## usersテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| nickname        | string     | null: false |
| email           | string     | null: false |
| password        | string     | null: false |
| last_name       | string     | null: false |
| first_name      | string     | null: false |
| last_name_kana  | string     | null: false |
| first_name_kana | string     | null: false |
| birthday        | date       | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| name         | string    | null: false                    |
| comment      | text      | null: false                    |
| category_id  | integer   | null: false                    |
| status_id    | integer   | null: false                    |
| postage_id   | integer   | null: false                    |
| area_id      | integer   | null: false                    |
| ship_date_id | integer   | null: false                    |
| price        | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :postage
- belongs_to_active_hash :area
- belongs_to_active_hash :ship_date


## deliveriesテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_cord    | string    | null: false                    |
| prefecture_id  | integer   | null: false                    |
| city           | string    | null: false                    |
| address        | string    | null: false                    |
| building_name  | string    |                                |
| phone_number   | string    | null: false                    |
| purchase       | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture

## purchasesテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |

### Association
- has_one    :delivery
- belongs_to :item
- belongs_to :user