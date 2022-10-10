class Book < ApplicationRecord
  # 追加ここから
  belongs_to :user # 追加
  validates :title, presence: true # タイトルの入力は必須
  validates :body, presence: true, length: { maximum: 200 } # 感想の入力は必須で200文字以下
  ## 追加ここまで
end