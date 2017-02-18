class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :f_name, null: false
      t.string :l_name
      t.string :nick_name
      t.string :team
      t.string :title
      t.string :location
      t.string :email
      t.string :slack
      t.string :mobile

      t.timestamps
    end
  end
end
