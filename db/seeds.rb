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

  apex_legends = Game.create!(
    name: "Apex Legends™",
    price: 0,
    genre: "Battle Royale",
    category: "Multiplayer",
    detail: "Apex Legends is the award-winning, free-to-play Hero Shooter from Respawn Entertainment. Master an ever-growing roster of legendary characters with powerful abilities, and experience strategic squad play and innovative gameplay in the next evolution of Hero Shooter and Battle Royale.",
    description: "Conquer with character in Apex Legends, a free-to-play* Hero shooter where legendary characters with powerful abilities team up to battle for fame & fortune on the fringes of the Frontier.
  
    Master an ever-growing roster of diverse Legends, deep-tactical squad play, and bold, new innovations that go beyond the Battle Royale experience — all within a rugged world where anything goes. Welcome to the next evolution of Hero Shooter.",
  )

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

  puyo_puyo = Game.create!(
    name: "Puyo Puyo™Tetris®",
    price: 19.99,
    genre: "Puzzle",
    category: "Competitive",
    detail: "Two puzzle game juggernauts collide as global phenomenon Tetris® and SEGA’s famous Puyo Puyo™ combine in a super mash-up of ferocious competition, adorable looks, and addictive puzzle fun!",
    description: "Two puzzle game juggernauts collide as Tetris®, one of the largest-selling and recognized brands in gaming history, and Puyo Puyo™ from SEGA combine to create a fun-to-play, fast-paced, competitive party game like no other!\n\nThere’s a ton of different styles of gameplay – from the single-player Adventure and Challenge modes to the ferocious competition of the up-to-four-player Arcade modes. Unlock new characters and backgrounds in Adventure mode, or unlock new character voices, skins for Puyos and Tetriminos, backgrounds and more in the in-game Shop. You can even try your puzzle skills on a global scale by playing any of the multiplayer modes with up to four players online in Puzzle League or Free Play modes.",
  )

  vampire_survivors = Game.create!(
    name: "Vampire Survivors",
    price: 4.99,
    genre: "Action Roguelike",
    category: "Pixel Graphics",
    detail: "Mow down thousands of night creatures and survive until dawn! Vampire Survivors is a gothic horror casual game with rogue-lite elements, where your choices can allow you to quickly snowball against the hundreds of monsters that get thrown at you.",
    description: "Vampire Survivors is a time survival game with minimalistic gameplay and roguelite elements.\n\nHell is empty, the devils are here, and there's no place to run or hide. All you can do is survive as long as you can until death inevitably puts an end to your struggles. Gather gold in each run to buy upgrades and help the next survivor.",
  )

  persona_5 = Game.create!(
    name: "Persona 5 Royal",
    price: 59.99,
    genre: "Story Rich",
    category: "JRPG",
    detail: "Don the mask and join the Phantom Thieves of Hearts as they stage grand heists, infiltrate the minds of the corrupt, and make them change their ways!",
    description: "Prepare for the award-winning RPG experience in this definitive edition of Persona 5 Royal, featuring a treasure trove of downloadable content included!",
  )

  among_us = Game.create!(
    name: "Among Us",
    price: 4.99,
    genre: "Social Deduction",
    category: "Multiplayer",
    detail: "An online and local party game of teamwork and betrayal for 4-15 players...in space!",
    description: "Play with 4-15 player online or via local WiFi as you attempt to prepare your spaceship for departure, but beware as one or more random players among the Crew are Impostors bent on killing everyone!

    Originally created as a party game, we recommend playing with friends at a LAN party or online using voice chat. Enjoy cross-platform play between Android, iOS, PC, and console.",
  )

  phasmophobia = Game.create!(
    name: "Phasmophobia",
    price: 13.99,
    genre: "Horror",
    category: "Multiplayer",
    detail: "Phasmophobia is a 4 player online co-op psychological horror. Paranormal activity is on the rise and it’s up to you and your team to use all the ghost-hunting equipment at your disposal in order to gather as much evidence as you can.",
    description: "Phasmophobia is a 4-player, online co-op, psychological horror game. You and your team of paranormal investigators will enter haunted locations filled with paranormal activity and try to gather as much evidence as you can. Use your ghost-hunting equipment to find and record evidence to sell on to a ghost removal team.",
  )

  elden_ring = Game.create!(
    name: "ELDEN RING",
    price: 59.99,
    genre: "Souls-like",
    category: "RPG",
    detail: "THE NEW FANTASY ACTION RPG. Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.",
    description: "THE NEW FANTASY ACTION RPG.
    Rise, Tarnished, and be guided by grace to brandish the power of the Elden Ring and become an Elden Lord in the Lands Between.",
  )

  puts "Done!"
end
