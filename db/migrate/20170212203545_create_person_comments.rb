class CreatePersonComments < ActiveRecord::Migration[5.0]
  def change
    create_table :person_comments do |t|
      t.references :person, null: false
      t.string :commenter, null: false, default: "Anonymous"
      t.string :comment, null: false

      t.timestamps
    end
  end
end
