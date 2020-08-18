class OrderAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :user_id ,:item_id
  
  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id
    validates :city
    validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/}
  end

  def save
    
    # 取引の情報を保存
    order = Order.create( user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, item_id: order.item_id)
  end

end