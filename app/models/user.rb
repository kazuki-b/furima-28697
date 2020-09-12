class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # has_many :items
  # has_many :purchases

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :email,                 uniqueness: true, format: { with: EMAIL_REGEX,message: 'のフォーマットが不適切です'}
    validates :password,              length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください' } 
    validates :password_confirmation, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください' } 
    validates :last_name,             format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name,            format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name_kana,        format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana,       format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end
end