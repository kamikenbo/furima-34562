
## users テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| email  | string | null: false, unique: true|
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
-has_many :managements




## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title   | string    | null: false |
| content | text    | null: false |
| category_id | integer    | null: false |
| item_condition_id | integer    | null: false |
| shipping_cost_id | integer    | null: false |
| prefecture_id | integer    | null: false |
| shipping_day_id | integer    | null: false |
| price | integer    | null: false |
| user    | references | null: false, foreign_key: true |

association
-belongs_to :user
-has_many :comments
-has_one :management
<!-- -has_many :deliveries -->


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

| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

-belongs_to :user 
<!-- -has_many :deliveries -->
-belongs_to :item
-has_one :deliveries

##  deliveries テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code    | string       | null: false          |
| prefecture_id    | integer | null: false,                |
| city    | string | null: false, |
| address    | string       | null: false          |
| building_name   | string    |
| phone_number    | string | null: false |
| management    | references | null: false, foreign_key: true |

<!-- -belongs_to :item -->
-belongs_to :management