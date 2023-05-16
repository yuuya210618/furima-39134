## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickame             | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| name                | string  | null: false               |
| name(kana)          | string  | null: false               |
| date-of-birth       | integer | null: false               |

- has_many :items
- has_many :purchases


## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| seller          | references | null: false, foreign_key: true |
| product-name    | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    | 
| condition       | string     | null: false                    |
| price           | integer    | null: false                    | 
| shipping-charge | inetger    | null: false                    |
| shipping-origin | string     | null: false                    |
| derivary-days   | string     | null: false                    |

- belongs_to :users
- belongs_to :purchases
- has_one_attached :image

## purchases テーブル
| Column          | Type       |Options                         |
| --------------- | ---------- |------------------------------- |
| buyer           | references | null: false, foreign_key: true |
| product-name    | string     | null: false                    |
| price           | integer    | null: false                    |
| shipping-charge | integer    | null: false                    |

- belongs_to :users
- belongs_to :items
- has_one :sends
- has_one_attached :product-image

## sends テーブル
| Column             | Type       |Options                         |
| ------------------ | ---------- | ------------------------------ |
| purchase           | references | null: false, foreign_key: true |
| post-code          | integer    | null: false                    |
| prefectures        | string     | null: false                    |
| mayor-ward-village | string     | null: false                    |
| address            | integer    | null: false                    |
| billding           | string     | null: false                    |
| telephone-number   | integer    | null: false                    |

- belongs_to:purchases