# テーブル設計

## users テーブル (ユーザー情報)
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |

### association
has_many :items
has_many :purchases


## items テーブル (商品情報)
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product            | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| shipping_fee_id    | integer    | null: false                    |
| prefecture_id      | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| ※imageはActiveStorageで実装するため含まない                          |

### association
belongs_to :user
has_one :purchase
belongs_to_active_hash :category_id
belongs_to_active_hash :condition_id
belongs_to_active_hash :shipping_fee_id
belongs_to_active_hash :prefecture_id
belongs_to_active_hash :delivery_time_id

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
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building_name      | string     |                                |
| phone_number       | string     | null: false                    |
| purchase           | references | null: false, foreign_key: true |

### association
belongs_to :purchase
belongs_to_active_hash :prefecture_id