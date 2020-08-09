class Item < ApplicationRecord
has_one_attached :image
belongs_to :user
has_one :order
has_many :addresses, through: items_addresses
belongs_to_active_hash :category
belongs_to_active_hash :status
belongs_to_active_hash :delivery_fee
belongs_to_active_hash :area
belongs_to_active_hash :days
end
