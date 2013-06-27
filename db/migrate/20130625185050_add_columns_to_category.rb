class AddColumnsToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :percentage, :integer
    add_column :categories, :description, :string
  end
end
