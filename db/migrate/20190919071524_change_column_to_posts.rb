class ChangeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :design, :name_id
    change_column :posts, :name_id, :integer
  end
end
