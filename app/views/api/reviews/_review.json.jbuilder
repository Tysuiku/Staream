json.extract! review, :id, :body, :recommended, :created_at, :updated_at
json.author review.author, :id, :display_name
