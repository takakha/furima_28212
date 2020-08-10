class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

   #空の投稿を保存できないようにする
   validates :item, :image, :text, :price,:category_id ,:status_id ,:delivery_fee_id , :area_id, :day_id,  presence: true

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :category_id, :status_id, :delivery_fee_id, :area_id, :day_id, numericality: { other_than: 1 }
   #価格の範囲が￥300〜￥9,999,999であるようにする
   validates :price, inclusion: {in: 300..9999999 }
  has_one_attached :image
  belongs_to :user
  has_one :order
  

end
