class CreateSkillDev < ActiveRecord::Migration
  def change
    create_table :skill_devs do |t|
      t.integer :developer_id
      t.integer :skill_id
    end
  end
end
