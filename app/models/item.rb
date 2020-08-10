class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

   #空の投稿を保存できないようにする
   validates :item, :text, :price,:category_id ,:status_id ,:delively_fee_id , :area_id, :day_id,  presence: true

   #ジャンルの選択が「--」の時は保存できないようにする
   validates :category_id, :status_id, :delively_fee_id, :area_id, :day_id, numericality: { other_than: 1 }

has_one_attached :image
belongs_to :user
has_one :order
has_many :addresses, through: items_addresses

end
