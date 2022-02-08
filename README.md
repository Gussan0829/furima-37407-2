# テーブル設計

## users テーブル

| Column                | Type      | Options                   |
| --------------------- | --------- | ------------------------- |
| nickname              | string    | null: false               |
| email                 | string    | null: false, unique: true |
| encrypted_password    | string    | null: false               |
| first_name_kan        | string    | null: false               |
| family_name_kan       | string    | null: false               |
| first_name_kana       | string    | null: false               |
| family_name_kana      | string    | null: false               |
| birth                 | date      | null: false               |



### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type        | Options                        |
| ------------------- | ----------- | ------------------------------ |
| name                | string      | null: false                    |
| category_id         | integer     | null: false                    |
| price               | integer     | null: false                    |
| content             | text        | null: false                    |
| charge_id           | integer      | null: false                    |
| delivery_id         | integer      | null: false                    |
| condition_id        | integer      | null: false                    |
| prefecture_id       | integer      | null: false                    |
| user                | references  | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :shipping

## shippings テーブル

| Column                   | Type        | Options                        |
| ------------------------ | ----------- | ------------------------------ |
| post_code                | string      | null: false                    |
| municipality             | string      | null: false                    |
| address                  | string      | null: false                    |
| building_name            | string      |                                |
| prefecture_id            | integer     | null: false                    |
| phone_number             | string      | null: false                    |
| purchase                 | references  | null: false, foreign_key: true |


### Association

- belongs_to :purchase