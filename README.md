# README

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | text    | null: false |
| first_name       | text    | null: false |
| family_name      | text    | null: false |
| first_name_kana  | text    | null: false |
| family_name_kana | text    | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| birthday         | date    | null: false |

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
| price                            | string        | null: false |
| user_id                          | references    | null: false |

## buying テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_number      | integer    | null: false |
| card_expire_date |            | null: false |
| security_code    | integer    | null: false |
| zip_code         | string     | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| address_line     | string     | null: false |
| phone_number     | string     | null: false |
| items_id         | references | null: false |

##  purchase_infoテーブル

| Column   | Type       | Options     |
| -------- | ---------- | ----------- |
| user_id  | references | null: false |
| items_id | references | null: false |