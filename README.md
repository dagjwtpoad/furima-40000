# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------  |
| nickname            | string | null: false               |
| email               | string | null: false               |
| encrypted_password  | string | null: false               |
| last_name           | string | null: false               |
| first_name          | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | reference  | null: false, foreign_key: true |
| title         | string     | null: false                    |
| text          | text       | null: false                    |
| category      | integer    | null: false                    |
| item_status   | integer    | null: false                    |
| shopping_cost | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| shopping_date | integer    | null: false                    |
| price         | integer    | null: false                    |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column       | Type            | Options                          |
| ------------ | --------------- | -------------------------------- |
| user         | reference       | null: false, foreign_key: true   |

### Association

- belongs_to :user
- belongs_to :items
- has_one :address

## address テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------  |
| postcode            | string  | null: false               |
| prefecture          | integer | null: false               |
| city                | string  | null: false               |
| block               | string  | null: false               |
| telephone_number    | string  | null: false               |

### Association

- belongs_to :orders