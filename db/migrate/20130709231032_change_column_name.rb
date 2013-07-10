class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :skills, :category_id, :area_id
  end
end
