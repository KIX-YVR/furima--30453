class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :purchase_infos
  has_many :items
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '無効な文字です' }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: '無効な文字です' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '無効な文字です' }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: '無効な文字です' }
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '無効な文字です' }
  end
end
