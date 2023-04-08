class Games < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :genre, null: false
      t.string :category
      t.text :detail, null: false
      t.text :description, null: false
      t.timestamps
    end
    add_index :games, :name, unique: true
  end
end
