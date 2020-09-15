# テーブル設計

## users テーブル

| Column          | Type       | Options                       |
| --------------- | -----------| ----------------------------- |
| nickname        | string     | null: false                   |
| familiy_name    | string     | null: false                   |
| first_name      | string     | null: false                   |
| first_name_kana | string     | null: false                   |
| birth_name      | string     | null: false                   |
| birth_month     | string     | null: false                   |
| password        | string     | null: false　　　　　　　　　    |
| email           | string     | null: false 　　　　　　　　　   |
| status          | integer    | null: false 　　　　　　　　　   |
| daleted_at      | string     | null: false 　　　　　　　　　   |
| user_id         | references | null: false, foreign_key: true|

### Association

- has_many :items_users
- has_many :items, through: items_users
- has_many :orders

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| condition      | integer    | null: false                    |
| price          | integer    | null: false                    |
| category_id    | references | null: false, foreign_key: true |
| shopping_id    | references | null: false, foreign_key: true |
| brand_id       | references | null: false, foreign_key: true |
| seller_user_id | references | null: false, foreign_key: true |
| trading_status | integer    | null: false                    |
| completed_at   | datatime   |                                |

### Association
- has_many :item_users
- has_many :users, through: items_users
- has_many :orders

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

## orders
s テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer_user_id | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item