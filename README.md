
## users テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| email  | string | null: false, uniqueness: true|
| name   | string | null: false |
| encrypted_password| string | null: false | 
| last_name  | string | null: false |
| first_name  | string | null: false |
| last_name_kana  | string | null: false |
| last_name_kana  | string | null: false |
|birthday| date | null: false |


association
-has_many :items
-has_many :comments
-has_many :users_tags
-has_many :tags, through: :users_tags




## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title   | string    | null: false |
| content | text    | null: false |
| category_id | text    | null: false |
| item_condition_id | integer    | null: false |
| shipping_cost_id | integer    | null: false |
| delivery_area_id | integer    | null: false |
| shipping_day_id | integer    | null: false |
| price | integer    | null: false |
| user    | references | null: false, foreign_key: true |

association
-belongs_to :user
has_many :comments
-has_many :users_tags
-has_many :users, through: :users_tags


## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | text       | null: false                               |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

association
-belongs_to :user
-belongs_to :item


## managements テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buyer    | string       | null: false          |
| saler    | string       | null: false          |
| user    | references | null: false, foreign_key: true |

-belongs_to :user 
-has_one :deliveries

##  deliveries テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code    | string       | null: false          |
| prefecture    | integer | null: false,                |
| city    | string | null: false, |
| address    | string       | null: false          |
| building_name   | string    |
| phone_number    | string | null: false, |
| managements    | references | null: false, foreign_key: true |

-belongs_to :management