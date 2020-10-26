# README

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | text    | null: false |
| name       | text    | null: false |
| name_kana  | text    | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| birthday   | string  | null: false |

## items テーブル

| Column                        | Type          | Options     |
| ----------------------------- | ------------- | ----------- |
| image                         | ActiveStorage | null: false |
| items_name                    | text          | null: false |
| explanation                   | text          | null: false |
| category                      | ActiveStorage | null: false |
| condition                     |               | null: false |
| who_pays_delivery_fee         |               | null: false |
| from_where_to_send            |               | null: false |
| how_long_does_it_take_to_send |               | null: false |
| price                         | string        | null: false |
| user_id                       | references    | null: false |

## buying テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| card_number      | integer    | null: false |
| card_expire_date |            | null: false |
| security_code    | integer    | null: false |
| zip_code         | integer    | null: false |
| prefecture       |            | null: false |
| city             | text       | null: false |
| address_line     | text       | null: false |
| phone_number     | integer    | null: false |
| items_id         | references | null: false |