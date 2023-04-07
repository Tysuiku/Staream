json.extract! game, :id, :name, :price, :detail, :description, :genre, :category
# json.csgoImg game.test_image.attached? ? game.test_image.url : nil
json.main_image game.main_image.attached? ? game.main_image.url : nil
json.game_image1 game.game_image1.attached? ? game.game_image1.url : nil
json.game_image2 game.game_image2.attached? ? game.game_image2.url : nil
json.game_image3 game.game_image3.attached? ? game.game_image3.url : nil
json.game_image4 game.game_image4.attached? ? game.game_image4.url : nil
