# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :items_users
- has_many :items, through: item_users
- has_many :purchases

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| text   | string | null: false |
| image  | string | null: false |
| fee    | string | null: false |
　　　　                               

### Association

- has_many :items_users
- has_many :users, through: items_users
- has_many :purchases

## items_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user