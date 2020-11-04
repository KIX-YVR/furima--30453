class Buying
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :token, :prefucture_id, :city, :address_line, :building_name, :phone_number, :purchase_info
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefucture_id
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A\d{11}\z/}
    validates :token
  end
  validates :prefucture_id, numericality: { other_than: 1, message: "can't be blank" } 

  def save
    purchase_info = PurchaseInfo.create(user_id: user_id, item_id: item_id)
    Address.create(zip_code: zip_code, prefucture_id: prefucture_id, city: city, address_line: address_line, building_name: building_name, phone_number: phone_number, purchase_info: purchase_info)
  end
end
