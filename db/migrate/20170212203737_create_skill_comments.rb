class CreateSkillComments < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_comments do |t|
      t.reference :skill, null: false
      t.string :commenter, null: false, default: "Anonymous"
      t.string :comment, null: false

      t.timestamps
    end
  end
end
