# テーブル設計

## users テーブル

| Column          | Type       | Options                       |
| --------------- | -----------| ----------------------------- |
| nickname        | string     | null: false                   |
| familiy_name    | string     | null: false                   |
| first_name      | string     | null: false                   |
| first_name_kana | string     | null: false                   |
| last_name       | string     | null: false                   |
| last_name_kana  | string     | null: false                   |
| birth_day       | date       | null: false                   |
| password        | string     | null: false　　　　　　　　　    |
| email           | string     | null: false 　　　　　　　　　   |

### Association
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| condition_id   | integer    | null: false                    |
| price          | integer    | null: false                    |
| category_id    | integer    | null: false, foreign_key: true |
| shopping_id    | intger     | null: false, foreign_key: true |
| brand_id       | integer    | null: false, foreign_key: true |
| seller_user_id | integer    | null: false, foreign_key: true |
| trading_status | integer    | null: false                    |

### Association
- has_many :users
- belongs_to :user

## orders
s テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer_user_id | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| customers_email_address | varchar | null: false             |
| customers_state         | varchar | null: false             |
| customers_city          | varchar | null: false             |
| customers_telephone     | varcher | null: false             |

### Association

- belongs_to :user
- belongs_to :item