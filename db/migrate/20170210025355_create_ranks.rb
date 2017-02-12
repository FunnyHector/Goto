class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.references :person, null: false
      t.references :skill, null: false
      t.integer :thumb_ups, null: false, default: 0
      t.integer :thumb_downs, null: false, default: 0

      t.timestamps
    end
  end
end
