class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true
  validates :password, format: { with: /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'is invalid' }
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: 'is invalid' }
  validates :last_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/, message: 'is invalid' }
end
