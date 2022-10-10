class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  # 追加ここから 
  has_many :books, dependent: :destroy # 追加
  validates :name, length: { minimum: 2, maximum: 20 }, uniqueness: true # 名前の入力は2文字以上20文字以下で、unique
  validates :introduction, presence: false, length: { maximum: 50 } # 自己紹介の入力は必須で、50文字以下
  # 追加ここまで
end
