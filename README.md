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
| birthday        | integer    | null: false |

### Association
- has_many :items

## itemsテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| name     | string    | null: false                    |
| image    | string    | null: false                    |
| comment  | text      | null: false                    |
| category | string    | null: false                    |
| status   | string    | null: false                    |
| price    | integer   | null: false                    |
| user     | reference | null: false, foreign_key: true |
| purchase | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :purchases
- has_one    :delivery

## deliveriesテーブル

| Column  | Type      | Options                        |
| ------- | --------- | ------------------------------ |
| postage | integer   | null: false                    |
| area    | string    | null: false                    |
| date    | date      | null: false                    |
| item    | reference | null: false, foreign_key: true |

### Association
- belongs_to :item

## purchasesテーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| prefecture     | string  | null: false, foreign_key: true |
| city           | string  | null: false, foreign_key: true |
| building_name  | string  | null: false, foreign_key: true |
| phone_number   | integer | null: false, foreign_key: true |

### Association
- has_many  :items
- has_one   :card

## cardsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| card_number    | integer    | null: false                    |
| date           | date       | null: false                    |
| security_cord  | integer    | null: false                    |
| postal_cord    | integer    | null: false                    |
| purchase       | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
