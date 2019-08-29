class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string       :design, null: false
      t.text         :about, null: false
      t.string       :image, null: false
      t.integer      :user_id
      t.timestamps
    end
  end
end
