class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :nickname, presence: true, length: { minimum: 6 }

  name_RegExp =  /\A([ぁ-んァ-ン一-龥]|ー)+\z/
  with_options presence: true,format: { with:name_RegExp} do
    validates :first_name
    validates :last_name
  end
    
  kana_RegExp = /\A([ァ-ン]|ー)+\z/
  with_options presence: true,format: { with:kana_RegExp} do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birth_date, presence: true

   

end

