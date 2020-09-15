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
| user_id         | integer    | null: false, foreign_key: true|
| trading_status  | integer    | null: false                   |
| days_ship       | integer    | null: false                   |


### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user　　　　　　| references | null: false, foreign_key: true |
| item     　　　| references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one: personal

## personals テーブル

| Column                  | Type      | Options             |   
| ----------------------- | ----------| -------------------- |
| prefecture_id           | intger    | null: false          |  
| city                    | string    | null: false          | 
| building                | string    | null: false          | 
| telephone               | string    | null: false          |  
| postal_code             | string    | null: false          | 
| orders                  | references| null: false,       foreign_key: true |

### Association
- belongs_to :order

