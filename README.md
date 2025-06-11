# テーブル設計

## users テーブル (ユーザー情報)

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| nickname           | string | null: false                    |
| email              | string | null: false, unique: true      |
| encrypted_password | string | null: false                    |
| last_name          | string | null: false                    |
| first_name         | string | null: false                    |
| last_name_kana     | string | null: false                    |
| first_name_kana    | string | null: false                    |
| birthday           | string | null: false                    |


## items テーブル (商品情報)

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| goods              | string | null: false                    |
| description        | string | null: false                    |
| category           | string | null: false                    |
| condition          | string | null: false                    |
| shipping fee       | string | null: false                    |
| sipping_area       | string | null: false                    |
| shipping_time      | string | null: false                    |
| price              | string | null: false                    |
| user_id            | string | null: false, foreign_key: true |
| ※imageはActiveStorageで実装するため含まない                      |


## purchase テーブル (購入情報)

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| item_id            | string | null: false, foreign_key: true |
| user_id            | string | null: false, foreign_key: true |
| ※imageはActiveStorageで実装するため含まない                      |


## shipping_address テーブル (配送先情報)

| Column             | Type   | Options                        |
| ------------------ | ------ | ------------------------------ |
| post_code          | string | null: false                    |
| prefectures        | string | null: false                    |
| municipality       | string | null: false                    |
| street_address     | string | null: false                    |
| building_name      | string |                                |
| phone_number       | string | null: false                    |