class DropCategoryTable < ActiveRecord::Migration
  def change
    rename_table :categories, :areas
  end
end
