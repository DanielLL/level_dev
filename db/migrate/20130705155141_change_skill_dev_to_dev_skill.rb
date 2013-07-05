class ChangeSkillDevToDevSkill < ActiveRecord::Migration
  def self.up
    remove_index :old_table_name, :column_name
    rename_table :old_table_name, :new_table_name
    add_index :new_table_name, :column_name
  end 

  def self.down
    remove_index :new_table_name, :column_name
    rename_table :new_table_name, :old_table_name
    add_index :old_table_name, :column_name
  end
end
