class AddDevSkillToDeveloper < ActiveRecord::Migration
  def change
    create_table :dev_skills do |t|
      t.integer :developer_id
      t.integer :skill_id
    end
  end
end
