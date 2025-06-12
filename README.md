# テーブル設計

## users テーブル (ユーザー情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |

### association
has_many :items
has_many :purchases
has_many :comments


## items テーブル (商品情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | string     | null: false                    |
| description        | text       | null: false                    |
| detail_id          | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |
| ※imageはActiveStorageで実装するため含まない                          |

### association
belongs_to :users
has_one :purchases
belongs_to_active_hash :detail_id


## comments テーブル (コメント情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


### association
belongs_to :user
belongs_to :item
has_one :shipping_address


## purchases テーブル (購入情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
| ※imageはActiveStorageで実装するため含まない                          |

### association
belongs_to :user
belongs_to :item
has_one :shipping_address


## shipping_addresses テーブル (配送先情報)

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null: false                    |
| prefectures_id     | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### association
belongs_to :purchase
belongs_to_active_hash :prefectures_id