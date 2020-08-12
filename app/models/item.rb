class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :item
    validates :image
    validates :text
    validates :price
    # ジャンルの選択が「--」の時は保存できないようにする
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_fee_id
      validates :area_id
      validates :day_id
    end
    # 価格の範囲が￥300〜￥9,999,999であるようにする
    with_options inclusion: { in: 300..9_999_999 } do
      validates :price
    end
  end
  has_one_attached :image
  belongs_to :user
  has_one :order
end
