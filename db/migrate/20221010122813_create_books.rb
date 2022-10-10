class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.integer :user_id # 書籍を投稿したユーザーid
      t.string :title # 本のタイトル
      t.text :body # 感想
      t.timestamps
    end
  end
end
