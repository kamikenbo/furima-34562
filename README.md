
## users テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| email  | string | null: false |
| name   | string | null: false |
| encrypted password| string | null: false、 uniqueness: true|
| encrypted password confirmation  | string | null: false |
| last_name  | string | null: false |
| first_name  | string | null: false |
| last_name_kana  | string | null: false |
| last_name_kana  | string | null: false |
|birthday| date | null: false |


association
-has_many :items
-has_many :comments
-has_one :credit

validates:email,uniqueness: confirmation:true


## items テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title   | string    | null: false |
| content | text    | null: false |
| category | text    | null: false |
| item_condition_id | integer    | null: false |
| shipping_cost_id | integer    | null: false |
| delivery_area_id | integer    | null: false |
| shipping_day_id | integer    | null: false |
| cost | integer    | null: false |
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


## credit テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card_number_id    | integer       | null: false          |
| expiration_date_id    | integer | null: false,                |
| security_card_id    | integer | null: false, |
| user    | references | null: false, foreign_key: true |

-belongs_to :user 
-has_one :delivery

##  delivery テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_card_id    | integer       | null: false          |
| prefecture_id    | integer | null: false,                |
| city_id    | integer | null: false, |
| address_id    | integer       | null: false          |
| building_id    | integer | null: false,                |
| phone_number_id    | integer | null: false, |
| credit    | references | null: false, foreign_key: true |

-belongs_to :credit