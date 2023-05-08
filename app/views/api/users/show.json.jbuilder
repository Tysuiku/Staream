# app/views/api/users/show.json.jbuilder

json.user do
  json.extract! @user, :id, :email, :username, :created_at, :updated_at

  json.purchased_games @user.owned_games.map { |game| { gameId: game.id } }
end
