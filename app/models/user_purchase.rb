class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :telephone, :token, :item_id, :user_id
  # 「住所」の郵便番号に関するバリデーション
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}, presence: true
  # 「住所」の電話番号に関するバリデーション
  validates :telephone, format: {with: /\A\d{10}$|^\d{11}\z/}, presence: true
  # 「住所」の都道府県に関するバリデーション
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  with_options  presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :address
    validates :city
  end

  def save
    # 購入の情報を保存
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所の情報を保存
    Personal.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, telephone: telephone, building: building, address: address, user_id: user_id, order_id: order.id)
  end
end
