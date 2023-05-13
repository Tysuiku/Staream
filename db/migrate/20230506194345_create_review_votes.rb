class CreateReviewVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :review_votes do |t|
      t.bigint :user_id, null: false
      t.bigint :review_id, null: false
      t.string :value, null: false

      t.timestamps
    end

    add_index :review_votes, :user_id
    add_index :review_votes, :review_id
    add_index :review_votes, [:user_id, :review_id], unique: true

    add_foreign_key :review_votes, :users
    add_foreign_key :review_votes, :reviews
  end
end
