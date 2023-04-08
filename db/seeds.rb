# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do
  puts "Destroying tables..."
  # Unnecessary if using `rails db:seed:replant`
  User.destroy_all

  puts "Resetting primary keys..."
  # For easy testing, so that after seeding, the first `User` has `id` of 1
  ApplicationRecord.connection.reset_pk_sequence!("users")

  puts "Creating users..."
  # Create one user with an easy to remember username, email, and password:
  User.create!(
    username: "Demo-User",
    email: "demo@user.io",
    password: "password",
  )

  me = User.create!(
    username: "Tysuiku",
    email: "tysuiku@user.io",
    password: "password123",
  )

  puts "Creating games"
  csgo = Game.create!( # CS:GO
    name: "Counter-Strike: Global Offensive",
    price: 0,
    genre: "First-Person-Shooter",
    category: "Multiplayer",
    detail: "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago. CS: GO features new maps, characters, weapons, and game modes, and delivers updated versions of the classic CS content (de_dust2, etc.).",
    description: "Counter-Strike: Global Offensive (CS: GO) expands upon the team-based action gameplay that it pioneered when it was launched 19 years ago.
    CS: GO features new maps, characters, weapons, and game modes, and delivers updated versions of the classic CS content (de_dust2, etc.).
    
    \"Counter-Strike took the gaming industry by surprise when the unlikely MOD became the most played online PC action game in the world almost immediately after its release in August 1999,\" said Doug Lombardi at Valve. \"For the past 12 years, it has continued to be one of the most-played games in the world, headline competitive gaming tournaments and selling over 25 million units worldwide across the franchise. CS: GO promises to expand on CS' award-winning gameplay and deliver it to gamers on the PC as well as the next gen consoles and the Mac.\"",
  )

  csgo.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maincsgo.jpeg"),
                         filename: "maincsgo.jpeg")

  csgo.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1csgo.jpg"),
                          filename: "gameimage1csgo.jpg")

  csgo.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2csgo.jpg"),
                          filename: "gameimage2csgo.jpg")

  csgo.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3csgo.jpg"),
                          filename: "gameimage3csgo.jpg")

  csgo.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4csgo.jpg"),
                          filename: "gameimage4csgo.jpg")

  apex_legends = Game.create!(
    name: "Apex Legends™",
    price: 0,
    genre: "Battle Royale",
    category: "Multiplayer",
    detail: "Apex Legends is the award-winning, free-to-play Hero Shooter from Respawn Entertainment. Master an ever-growing roster of legendary characters with powerful abilities, and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.",
    description: "Conquer with character in Apex Legends, a free-to-play* Hero shooter where legendary characters with powerful abilities team up to battle for fame & fortune on the fringes of the Frontier.
  
    Master an ever-growing roster of diverse Legends, deep-tactical squad play, and bold, new innovations that go beyond the Battle Royale experience — all within a rugged world where anything goes. Welcome to the next evolution of Hero Shooter.",
  )

  apex_legends.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainapex.jpeg"),
                                 filename: "mainapex.jpeg")

  apex_legends.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1apex.jpg"),
                                  filename: "gameimage1apex.jpg")

  apex_legends.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2apex.jpg"),
                                  filename: "gameimage2apex.jpg")

  apex_legends.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3apex.jpg"),
                                  filename: "gameimage3apex.jpg")

  apex_legends.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4apex.jpg"),
                                  filename: "gameimage4apex.jpg")

  holocure = Game.create!(
    name: "Holocure",
    price: 0,
    genre: "Action Roguelike",
    category: "Pixel Graphics",
    detail: "Holocure save the fans featuring the vtuber talents of Hololive",
    description: "This is a completely free, unofficial fangame featuring the vtuber talents of Hololive, with gameplay that is heavily inspired by Vampire Survivors and Magic Survival.\
    Collect powerful weapons and items and experiment with all kinds of builds to create the ultimate character!\
    Will you be able to defeat the endless waves of enemies, and reach the top rankings?",
  )

  holocure.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainholocure.jpeg"),
                             filename: "mainholocure.jpeg")

  holocure.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1holocure.jpg"),
                              filename: "gameimage1holocure.jpg")

  holocure.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2holocure.jpg"),
                              filename: "gameimage2holocure.jpg")

  holocure.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3holocure.jpg"),
                              filename: "gameimage3holocure.jpg")

  holocure.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4holocure.jpg"),
                              filename: "gameimage4holocure.jpg")

  puyo_puyo2 = Game.create!(
    name: "Puyo Puyo™ Tetris® 2",
    price: 29.99,
    genre: "Puzzle",
    category: "Casual",
    detail: "Japan’s beloved puzzle game series Puyo Puyo and the world-renowned Tetris® game franchise have teamed up again to deliver even more Puyo-popping and Tetrimino-clearing fun in Puyo Puyo Tetris 2.",
    description: "Two Legends Reunite for the Ultimate Puzzle Match
    Japan’s beloved puzzle game series Puyo Puyo and the world-renowned Tetris® game franchise have teamed up again to deliver even more Puyo-popping and Tetrimino-clearing fun!",
  )

  puyo_puyo2.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainpuyopuyo.jpeg"),
                               filename: "mainpuyopuyo.jpeg")

  puyo_puyo2.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1puyo.jpg"),
                                filename: "gameimage1puyo.jpg")

  puyo_puyo2.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2puyo.jpg"),
                                filename: "gameimage2puyo.jpg")

  puyo_puyo2.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3puyo.jpg"),
                                filename: "gameimage3puyo.jpg")

  puyo_puyo2.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4puyo.jpg"),
                                filename: "gameimage4puyo.jpg")

  vampire_survivors = Game.create!(
    name: "Vampire Survivors",
    price: 4.99,
    genre: "Action Roguelike",
    category: "Pixel Graphics",
    detail: "Mow down thousands of night creatures and survive until dawn! Vampire Survivors is a gothic horror casual game with rogue-lite elements, where your choices can allow you to quickly snowball against the hundreds of monsters that get thrown at you.",
    description: "Vampire Survivors is a time survival game with minimalistic gameplay and roguelite elements.\n\nHell is empty, the devils are here, and there's no place to run or hide. All you can do is survive as long as you can until death inevitably puts an end to your struggles. Gather gold in each run to buy upgrades and help the next survivor.",
  )

  vampire_survivors.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainvampiresurvivors.jpeg"),
                                      filename: "mainvampiresurvivors.jpeg")

  vampire_survivors.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1vamp.jpg"),
                                       filename: "gameimage1vamp.jpg")

  vampire_survivors.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2vamp.jpg"),
                                       filename: "gameimage2vamp.jpg")

  vampire_survivors.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3vamp.jpg"),
                                       filename: "gameimage3vamp.jpg")

  vampire_survivors.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4vamp.jpg"),
                                       filename: "gameimage4vamp.jpg")

  persona_5R = Game.create!(
    name: "Persona 5 Royal",
    price: 59.99,
    genre: "Story Rich",
    category: "JRPG",
    detail: "Don the mask and join the Phantom Thieves of Hearts as they stage grand heists, infiltrate the minds of the corrupt, and make them change their ways!",
    description: "Prepare for the award-winning RPG experience in this definitive edition of Persona 5 Royal, featuring a treasure trove of downloadable content included!",
  )

  persona_5R.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainpersona5R.jpeg"),
                               filename: "mainpersona5R.jpeg")

  persona_5R.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1persona5.jpg"),
                                filename: "gameimage1persona5.jpg")

  persona_5R.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2persona5.jpg"),
                                filename: "gameimage2persona5.jpg")

  persona_5R.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3persona5.jpg"),
                                filename: "gameimage3persona5.jpg")

  persona_5R.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4persona5.jpg"),
                                filename: "gameimage4persona5.jpg")

  among_us = Game.create!(
    name: "Among Us",
    price: 4.99,
    genre: "Social Deduction",
    category: "Multiplayer",
    detail: "An online and local party game of teamwork and betrayal for 4-15 players...in space!",
    description: "Play with 4-15 player online or via local WiFi as you attempt to prepare your spaceship for departure, but beware as one or more random players among the Crew are Impostors bent on killing everyone!

    Originally created as a party game, we recommend playing with friends at a LAN party or online using voice chat. Enjoy cross-platform play between Android, iOS, PC, and console.",
  )

  among_us.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainamongus.jpeg"),
                             filename: "mainamongus.jpeg")

  among_us.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1amongus.jpg"),
                              filename: "gameimage1amongus.jpg")

  among_us.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2amongus.jpg"),
                              filename: "gameimage2amongus.jpg")

  among_us.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3amongus.jpg"),
                              filename: "gameimage3amongus.jpg")

  among_us.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4amongus.jpg"),
                              filename: "gameimage4amongus.jpg")

  phasmophobia = Game.create!(
    name: "Phasmophobia",
    price: 13.99,
    genre: "Horror",
    category: "Multiplayer",
    detail: "Phasmophobia is a 4 player online co-op psychological horror. Paranormal activity is on the rise and it’s up to you and your team to use all the ghost-hunting equipment at your disposal in order to gather as much evidence as you can.",
    description: "Phasmophobia is a 4-player, online co-op, psychological horror game. You and your team of paranormal investigators will enter haunted locations filled with paranormal activity and try to gather as much evidence as you can. Use your ghost-hunting equipment to find and record evidence to sell on to a ghost removal team.",
  )

  phasmophobia.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainphasmo.jpeg"),
                                 filename: "mainphasmo.jpeg")

  phasmophobia.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1phasmo.jpg"),
                                  filename: "gameimage1phasmo.jpg")

  phasmophobia.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2phasmo.jpg"),
                                  filename: "gameimage2phasmo.jpg")

  phasmophobia.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3phasmo.jpg"),
                                  filename: "gameimage3phasmo.jpg")

  phasmophobia.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4phasmo.jpg"),
                                  filename: "gameimage4phasmo.jpg")

  elden_ring = Game.create!(
    name: "ELDEN RING",
    price: 59.99,
    genre: "Souls-like",
    category: "RPG",
    detail: "THE NEW FANTASY ACTION RPG. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.",
    description: "THE NEW FANTASY ACTION RPG.
    Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.",
  )

  elden_ring.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maineldenring.jpeg"),
                               filename: "maineldenring.jpeg")

  elden_ring.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1elden.jpg"),
                                filename: "gameimage1elden.jpg")

  elden_ring.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2elden.jpg"),
                                filename: "gameimage2elden.jpg")

  elden_ring.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3elden.jpg"),
                                filename: "gameimage3elden.jpg")

  elden_ring.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4elden.jpg"),
                                filename: "gameimage4elden.jpg")

  stardew_valley = Game.create!(
    name: "Stardew Valley",
    price: 59.99,
    genre: "Farming Sim",
    category: "Pixel Graphics",
    detail: "You've inherited your grandfather's old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life. Can you learn to live off the land and turn these overgrown fields into a thriving home?",
    description: "Stardew Valley is an open-ended country-life RPG! \n\nYou've inherited your grandfather's old farm plot in Stardew Valley. Armed with hand-me-down tools and a few coins, you set out to begin your new life. Can you learn to live off the land and turn these overgrown fields into a thriving home? \n\nIt won't be easy. Ever since Joja Corporation came to town, the old ways of life have all but disappeared. The community center, once the town's most vibrant hub of activity, now lies in shambles. But the valley seems full of opportunity. With a little dedication, you might just be the one to restore Stardew Valley to greatness!",
  )

  stardew_valley.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainstardewvalley.jpeg"),
                                   filename: "mainstardewvalley.jpeg")

  stardew_valley.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1stardew.jpg"),
                                    filename: "gameimage1stardew.jpg")

  stardew_valley.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2stardew.jpg"),
                                    filename: "gameimage2stardew.jpg")

  stardew_valley.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3stardew.jpg"),
                                    filename: "gameimage3stardew.jpg")

  stardew_valley.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4stardew.jpg"),
                                    filename: "gameimage4stardew.jpg")

  puts "Done!"
end
