class ChangeColumnToPosts < ActiveRecord::Migration[5.2]
  # 変更内容
  def up
    # add_column :posts, :name_id, :integer, null: false
  end

  # 変更前の状態
  def down
    # remove_column :posts, :design, :string, null: false
  end

end
