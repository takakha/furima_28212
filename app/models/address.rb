class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :item
  
  with_options presence: true do
    VAVID_POST_REGEX =  /\A[0-9]{3}-[0-9]{4}\z/.freeze
    validates_format_of :postcode,  with: VAVID_POST_REGEX  
    validates :city
    validates :block
    VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/.freeze
    validates_format_of :phone_number,  with: VALID_PHONE_REGEX 
    validates :prefecture_id
  end
  validates :prefecture_id, numericality: { other_than: 1 }
end
