class CreateComics < ActiveRecord::Migration[5.1]
  def change
    create_table :comics do |t|
      t.references :user, foreign_key: true 
      t.integer :num, null: false
      t.string :img_url, null: false
      t.string :title, null: false

      t.timestamps
    end
  end
end
