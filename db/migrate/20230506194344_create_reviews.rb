class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.bigint :author_id, null: false
      t.bigint :game_id, null: false
      t.text :body, null: false
      t.boolean :recommended, null: false

      t.timestamps
    end

    add_index :reviews, :author_id
    add_index :reviews, :game_id
    add_index :reviews, [:author_id, :game_id], unique: true

    add_foreign_key :reviews, :users, column: :author_id
    add_foreign_key :reviews, :games
  end
end
