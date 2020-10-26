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

has_many purchase_info table 
has_many items table

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
| user                             | references    | null: false |

belongs_to user table
has_many purchase_info table
has_one buying table

## buying テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| zip_code         | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| address_line     | string     | null: false |
| building_name    | string     |             |
| phone_number     | string     | null: false |
| purchase_info    | references | null: false |

belongs_to items table

##  purchase_infoテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| user     | references | null: false |
| items    | references | null: false |

belongs_to user table
belongs_to items table