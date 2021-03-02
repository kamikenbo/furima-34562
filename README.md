
## user テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| email  | string | null: false |
| name   | string | null: false |
|password| string | null: false |
| password confirmation  | string | null: false |
| last_name  | string | null: false |
| first_name  | string | null: false |
| last_name_kana  | string | null: false |
| last_name_kana  | string | null: false |
|birthday| date | null: false |


association
-has_many :items
-has_many :comments


## item テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title   | string    | null: false |
| content | text    | null: false |
| category | text    | null: false |
| item_condition | text    | null: false |
| shipping_cost | text    | null: false |
| delivery_area | text    | null: false |
| shipping_days | text    | null: false |
| cost | text    | null: false |
| user    | references | null: false, foreign_key: true |

association
-belongs_to :user
has_many :comments


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                               |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

association
-belongs_to :user
-belongs_to :item
