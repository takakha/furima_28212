# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column              | Type      | Options     |
| ------------------- | --------- | ----------- |
| nickname            | string    | null: false |
| email               | string    | null: false |
| encrypted_password  | string    | null: false |
| first_name          | string    | null: false |
| last_name           | string    | null: false |
| first_name_kana     | string    | null: false |
| last_name_kana      | string    | null: false |
| birthday            | date      | null: false |



### Association

- has_many :items
- has_one :order
- belongs_to_active_hash :birthday_year
- belongs_to_active_hash :birthday_mon
- belongs_to_active_hash :birthday_day

## items テーブル

| Column          | Type       | Options                           |
| --------------- | ---------- | --------------------------------- |
| item            | string     | null: false                       |
| text            | text       | null: false                       |
| price           | integer    | null: false                       |
| category_id     | integer    | null: false                       |
| status_id       | integer    | null: false                       |
| delivery_fee_id | integer    | null: false                       |
| area_id         | integer    | null: false                       |
| days_id         | integer    | null: false                       | 
| user            | references | null: false, foreign_key: true    | 
 


### Association

- has_one_attached :image
- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :delivery_fee
- belongs_to_active_hash :area
- belongs_to_active_hash :days


##  ordersテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null:false, foreign_key: true  |
| item    | references | null:false, foreign_key: true  |



### Association

- belongs_to :user
- belongs_to :item

##  addressesテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null:false                     |
| prefecture_id  | integer    | null:false                     |
| city           | string     | null:false                     |
| block          | string     | null:false                     |
| building       | string     |                                |
| phone_number   | string     | null:false                     |





### Association

- belongs_to_active_hash :prefecture
