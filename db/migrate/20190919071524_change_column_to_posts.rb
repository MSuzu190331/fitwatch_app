class ChangeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :design, :name_id
    change_column :posts, :name_id, 'integer USING CAST(column_name AS integer)'
    # change_column :posts, :name_id, :integer
  end
end
