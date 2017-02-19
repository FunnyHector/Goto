class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :title, null: false, unique: true
      t.string :description

      t.timestamps
    end
  end
end
