json.review do
  json.set! @review.id do
    json.partial! "review", review: @review
  end
end

json.user do
  json.set! @review.author_id do
    json.extract! @review.author, :id, :email, :username # Replace ':display_name' with ':username'
    json.num_owned_games @review.author.owned_games.length
    json.num_reviews @review.author.reviews.length
  end
end
