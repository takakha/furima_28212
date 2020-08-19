class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :item
  
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}    
    validates :city
    validates :block
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
    validates :prefecture_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }
end
