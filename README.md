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

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| name     | string    | null: false                    |
| comment  | text      | null: false                    |
| category | integer   | null: false                    |
| status   | integer   | null: false                    |
| postage  | integer   | null: false                    |
| area     | integer   | null: false                    |
| date     | integer   | null: false                    |
| price    | integer   | null: false                    |
| user     | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase

## deliveriesテーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postal_cord    | string   | null: false                    |
| prefecture     | integer   | null: false                    |
| city           | string    | null: false                    |
| address        | string    | null: false                    |
| building_name  | string    |                                |
| phone_number   | string    | null: false                    |
| item           | reference | null: false, foreign_key: true |
| purchase       | reference | null: false, foreign_key: true |

### Association
- belongs_to :purchase

## purchasesテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | reference | null: false, foreign_key: true |
| item     | reference | null: false, foreign_key: true |

### Association
- has_one    :delivery
- belongs_to :item
- belongs_to :user