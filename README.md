# README

# アプリケーション概要
フリーマーケットのアプリケーションを作成しました。ユーザーを登録すると商品を出品できるようになります。自身が出品した商品は、編集と削除をすることができます。他のユーザーが出品した商品は、クレジットカードを用いて購入することができます。

## URL
http://54.92.64.120/

## Basic認証のIDとパスワード
ID: admin
パスワード: 2222

## 出品者用
mail: y.3doors-up.t@docomo.ne.jp 
パスワード: 0921taka

## 購入者用
mail: y.5doors-up.t@docomo.ne.jp 
パスワード: 0921taka

## 購入用カードの番号・期限・セキュリティコード
カード番号: 4242424242424242
CVC: 123
有効期限: 登録時より未来



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
- has_one :address
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
| item           | references | null:false, foreign_key: true  |




### Association

- belongs_to_active_hash :prefecture
- belongs_to :item


