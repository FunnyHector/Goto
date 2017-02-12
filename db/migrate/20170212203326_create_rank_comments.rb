class CreateRankComments < ActiveRecord::Migration[5.0]
  def change
    create_table :rank_comments do |t|
      t.reference :rank, null: false
      t.string :commenter, null: false, default: "Anonymous"
      t.string :comment, null: false

      t.timestamps
    end
  end
end
