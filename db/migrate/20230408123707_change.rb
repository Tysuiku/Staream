class Change < ActiveRecord::Migration[7.0]
  def change
    add_column :games, :developer, :string, null: false, default: ""
    add_column :games, :publisher, :string, null: false, default: ""
    add_column :games, :release_date, :string, null: false, default: ""

    add_index :games, :developer
    add_index :games, :publisher
  end
end
