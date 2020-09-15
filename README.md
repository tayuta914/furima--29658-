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
- has_many :items
- has_many :orders
- belongs_to

## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| condition_id   | integer    | null: false                    |
| price          | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| shopping_id    | intger     | null: false                    |
| user_id        | integer    | null: false                    |
| trading_status | integer    | null: false                    |

### Association
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| buyer_user_id | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| customers_state         | string | null: false              |
| customers_city          | string | null: false              |
| customers_telephone     | string | null: false              |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :order