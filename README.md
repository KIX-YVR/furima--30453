# README

## users テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| nickname         | string     | null: false |
| first_name       | string     | null: false |
| family_name      | string     | null: false |
| first_name_kana  | string     | null: false |
| family_name_kana | string     | null: false |
| email            | string     | null: false |
| password         | string     | null: false |
| birthday         | date       | null: false |

has_many :purchase_infos
has_many :items 

## items テーブル

| Column                           | Type          | Options     |
| -------------------------------- | ------------- | ----------- |
| name                             | string        | null: false |
| explanation                      | text          | null: false |
| category_id                      | integer       | null: false |
| condition_id                     | integer       | null: false |
| who_pays_delivery_fee_id         | integer       | null: false |
| from_where_to_send_id            | integer       | null: false |
| how_long_does_it_take_to_send_id | integer       | null: false |
| price                            | integer       | null: false |
| user                             | references    | null: false, foreign_key: true |

belongs_to :users
has_many :purchase_infos 

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| zip_code         | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| city             | string     | null: false                    |
| address_line     | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase_info    | references | null: false, foreign_key: true |

belongs_to :purchase_infos

##  purchase_infosテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

belongs_to :users 
belongs_to :items 
has_one :addresses