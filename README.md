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

## items テーブル

| Column          | Type       | Options                       |
| --------------- | ---------- | ----------------------------- |
| name            | string     | null: false                   |
| text            | text       | null: false                   |
| condition_id    | integer    | null: false                   |
| price           | integer    | null: false                   |
| category        | integer    | null: false                   |
| shipping_status | intger     | null: false                   |
| user_id         | integer    | null: false                   |
| trading_status  | integer    | null: false                   |
| days_ship       | integer    | null: false                   |


### Association
- belongs_to :user

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## personals テーブル

| Column                  | Type   | Options                  |
| ----------------------- | ------ | ------------------------ |
| customers_state         | string | null: false              |
| customers_city          | string | null: false              |
| customers_telephone     | string | null: false              |
| customers_email_address | string | null: false              |
| cc_number               | string | null: false              |
| cc_expires              | string | null: false              |
| code                    | string | null: false              |

### Association
- belongs_to :order