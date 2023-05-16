## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickame             | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name(kana)     | string  | null: false               |
| first_name(kana)    | string  | null: false               |
| date_of_birth       | date    | null: false               |

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    | 
| condition_id       | integer    | null: false                    |
| price              | integer    | null: false                    | 
| shipping_charge_id | inetger    | null: false                    |
| shipping_origin_id | integer    | null: false                    |
| derivary_days_id   | integer    | null: false                    |

- belongs_to :users
- belongs_to :purchases

## purchases テーブル
| Column          | Type       |Options                         |
| --------------- | ---------- |------------------------------- |
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

- belongs_to :users
- belongs_to :items
- has_one :sends

## sends テーブル
| Column             | Type       |Options                         |
| ------------------ | ---------- | ------------------------------ |
| purchase           | references | null: false, foreign_key: true |
| post_code          | string     | null: false                    |
| prefectures        | string     | null: false                    |
| mayor_ward_village | string     | null: false                    |
| address            | integer    | null: false                    |
| billding           | string     | null: false                    |
| telephone_number   | string     | null: false                    |

- belongs_to:purchases