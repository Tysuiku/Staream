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
    developer: "Valve, Hidden Path Entertainment",
    publisher: "Valve",
    release_date: "Aug 21, 2012",
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
    developer: "Respawn Entertainment",
    publisher: "Electronic Arts",
    release_date: "Nov 4, 2020",
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
    developer: "Kay Yu",
    publisher: "Kay Yu",
    release_date: "June 24, 2022 ",
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
    developer: "SEGA",
    publisher: "SEGA",
    release_date: "Mar 23, 2021",
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
    developer: "poncle",
    publisher: "poncle",
    release_date: "Oct 20, 2022",
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
    developer: "ATLUS",
    publisher: "SEGA",
    release_date: "Oct 21, 2022",
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
    developer: "Innersloth",
    publisher: "Innersloth",
    release_date: "Nov 16, 2018",
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
    developer: "Kinetic Games",
    publisher: "Kinetic Games",
    release_date: "Sep 18, 2020",
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
    developer: "FromSoftware Inc.",
    publisher: "FromSoftware Inc.",
    release_date: "Feb 24, 2022",
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
    developer: "ConcernedApe",
    publisher: "ConcernedApe",
    release_date: "Feb 26, 2016",
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

  destiny2 = Game.create!(
    name: "Destiny 2",
    price: 0,
    genre: "FPS",
    category: "MMORPG",
    developer: "Bungie",
    publisher: "Bungie",
    release_date: "Oct 1, 2019",
    detail: "Destiny 2 is an action MMO with a single evolving world that you and your friends can join anytime, anywhere, absolutely free.",
    description: "Dive into the world of Destiny 2 to explore the mysteries of the solar system and experience responsive first-person shooter combat.\nUnlock powerful elemental abilities and collect unique gear to customize your Guardian's look and playstyle.\nEnjoy Destiny 2’s cinematic story, challenging co-op missions, and a variety of PvP modes alone or with friends.\nDownload for free today and write your legend in the stars.",
  )

  destiny2.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maindestiny2.jpeg"),
                             filename: "maindestiny2.jpeg")

  destiny2.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1destiny2.jpg"),
                              filename: "gameimage1destiny2.jpg")

  destiny2.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2destiny2.jpg"),
                              filename: "gameimage2destiny2.jpg")

  destiny2.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3destiny2.jpg"),
                              filename: "gameimage3destiny2.jpg")

  destiny2.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4destiny2.jpg"),
                              filename: "gameimage4destiny2.jpg")

  poe = Game.create!(
    name: "Path of Exile",
    price: 0,
    genre: "Action RPG",
    category: "RPG",
    developer: "Grinding Gear Games",
    publisher: "Grinding Gear Games",
    release_date: "Oct 23, 2013",
    detail: "You are an Exile, struggling to survive on the dark continent of Wraeclast, as you fight to earn power that will allow you to exact your revenge against those who wronged you. Created by hardcore gamers, Path of Exile is an online Action RPG set in a dark fantasy world.",
    description: "You are an Exile, struggling to survive on the dark continent of Wraeclast, as you fight to earn power that will allow you to exact your revenge against those who wronged you. Created by hardcore gamers, Path of Exile is an online Action RPG set in a dark fantasy world. With a focus on visceral action combat, powerful items and deep character customization, Path of Exile is completely free and will never be pay-to-win.",
  )

  poe.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainpathofexile.jpeg"),
                        filename: "mainpathofexile.jpeg")

  poe.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1pathofexile.jpg"),
                         filename: "gameimage1pathofexile.jpg")

  poe.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2pathofexile.jpg"),
                         filename: "gameimage2pathofexile.jpg")

  poe.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3pathofexile.jpg"),
                         filename: "gameimage3pathofexile.jpg")

  poe.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4pathofexile.jpg"),
                         filename: "gameimage4pathofexile.jpg")

  miku = Game.create!(
    name: "Hatsune Miku: Project DIVA Mega Mix+",
    price: 39.39,
    genre: "Rhythm",
    category: "Anime",
    developer: "SEGA",
    publisher: "SEGA",
    release_date: "May 26, 2022",
    detail: "Take center stage in Hatsune Miku’s premier rhythm game starring the world’s #1 virtual pop star! With a stunner setlist and enormous wardrobe to style, it’s Miku’s ultimate tour—all it needs is you.",
    description: "Take center stage in Hatsune Miku’s premier rhythm game starring the world’s #1 virtual pop star! From a stunner setlist of songs to an enormous wardrobe to style, this is the ultimate tour with Hatsune Miku, Kagamine Rin and Len, Megurine Luka, MEIKO and KAITO—all it needs is you.

    Start by choosing a song, then tap and hold buttons at the right time with the icons on-screen. It’s simple to grasp, and challenging to master. Vibe with the music videos on Easy or aim for a high score on Extreme! Button inputs can be configured to harmonize with playstyle and accessibility preferences, supported by Steam-compatible controllers.",
  )

  miku.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainhatsunemiku.jpeg"),
                         filename: "mainhatsunemiku.jpeg")

  miku.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1miku.jpg"),
                          filename: "gameimage1miku.jpg")

  miku.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2miku.jpg"),
                          filename: "gameimage2miku.jpg")

  miku.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3miku.jpg"),
                          filename: "gameimage3miku.jpg")

  miku.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4miku.jpg"),
                          filename: "gameimage4miku.jpg")

  unpack = Game.create!(
    name: "Unpacking",
    price: 19.99,
    genre: "Puzzle",
    category: "Pixel Graphics",
    developer: "Witch Beam",
    publisher: "Humble Games",
    release_date: "Nov 2, 2021",
    detail: "Unpacking is a zen puzzle game about the familiar experience of pulling possessions out of boxes and fitting them into a new home. Part block-fitting puzzle, part home decoration, you are invited to create a satisfying living space while learning clues about the life you’re unpacking.",
    description: "Unpacking is a zen game about the familiar experience of pulling possessions out of boxes and fitting them into a new home. Part block-fitting puzzle, part home decoration, you are invited to create a satisfying living space while learning clues about the life you’re unpacking. Over the course of eight house moves, you are given a chance to experience a sense of intimacy with a character you never see and a story you’re never told.",
  )

  unpack.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainunpacking.jpeg"),
                           filename: "mainunpacking.jpeg")

  unpack.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1unpacking.jpg"),
                            filename: "gameimage1unpacking.jpg")

  unpack.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2unpacking.jpg"),
                            filename: "gameimage2unpacking.jpg")

  unpack.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3unpacking.jpg"),
                            filename: "gameimage3unpacking.jpg")

  unpack.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4unpacking.jpg"),
                            filename: "gameimage4unpacking.jpg")

  celeste = Game.create!(
    name: "Celeste",
    price: 19.99,
    genre: "Precision Platformer",
    category: "Pixel Graphics",
    developer: "Extremely OK Games, Ltd.",
    publisher: "Maddy Makes Games Inc.",
    release_date: "Jan 25, 2018",
    detail: "Help Madeline survive her inner demons on her journey to the top of Celeste Mountain, in this super-tight platformer from the creators of TowerFall. Brave hundreds of hand-crafted challenges, uncover devious secrets, and piece together the mystery of the mountain.",
    description: "Help Madeline survive her inner demons on her journey to the top of Celeste Mountain, in this super-tight, hand-crafted platformer from the creators of multiplayer classic TowerFall.",
  )

  celeste.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainceleste.jpeg"),
                            filename: "mainceleste.jpeg")

  celeste.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1celeste.jpg"),
                             filename: "gameimage1celeste.jpg")

  celeste.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2celeste.jpg"),
                             filename: "gameimage2celeste.jpg")

  celeste.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3celeste.jpg"),
                             filename: "gameimage3celeste.jpg")

  celeste.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4celeste.jpg"),
                             filename: "gameimage4celeste.jpg")

  hollowknight = Game.create!(
    name: "Hollow Knight",
    price: 14.99,
    genre: "Souls-like",
    category: "Platformer",
    developer: "Team Cherry",
    publisher: "Team Cherry",
    release_date: "Feb 24, 2017",
    detail: "Forge your own path in Hollow Knight! An epic action adventure through a vast ruined kingdom of insects and heroes. Explore twisting caverns, battle tainted creatures and befriend bizarre bugs, all in a classic, hand-drawn 2D style.",
    description: "Beneath the fading town of Dirtmouth sleeps an ancient, ruined kingdom. Many are drawn below the surface, searching for riches, or glory, or answers to old secrets.

    Hollow Knight is a classically styled 2D action adventure across a vast interconnected world. Explore twisting caverns, ancient cities and deadly wastes; battle tainted creatures and befriend bizarre bugs; and solve ancient mysteries at the kingdom's heart.",
  )

  hollowknight.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainhollowknight.jpeg"),
                                 filename: "mainhollowknight.jpeg")

  hollowknight.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1hollowknight.jpg"),
                                  filename: "gameimage1hollowknight.jpg")

  hollowknight.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2hollowknight.jpg"),
                                  filename: "gameimage2hollowknight.jpg")

  hollowknight.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3hollowknight.jpg"),
                                  filename: "gameimage3hollowknight.jpg")

  hollowknight.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4hollowknight.jpg"),
                                  filename: "gameimage4hollowknight.jpg")

  theforest = Game.create!(
    name: "The Forest",
    price: 19.99,
    genre: "Survival",
    category: "Open World",
    developer: "Endnight Games Ltd",
    publisher: "Endnight Games Ltd",
    release_date: "Apr 30, 2018",
    detail: "As the lone survivor of a passenger jet crash, you find yourself in a mysterious forest battling to stay alive against a society of cannibalistic mutants. Build, explore, survive in this terrifying first person survival horror simulator.",
    description: "As the lone survivor of a passenger jet crash, you find yourself in a mysterious forest battling to stay alive against a society of cannibalistic mutants.

    Build, explore, survive in this terrifying first person survival horror simulator.",
  )

  theforest.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maintheforest.jpeg"),
                              filename: "maintheforest.jpeg")

  theforest.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1theforest.jpg"),
                               filename: "gameimage1theforest.jpg")

  theforest.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2theforest.jpg"),
                               filename: "gameimage2theforest.jpg")

  theforest.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3theforest.jpg"),
                               filename: "gameimage3theforest.jpg")

  theforest.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4theforest.jpg"),
                               filename: "gameimage4theforest.jpg")

  lostark = Game.create!(
    name: "Lost Ark",
    price: 0,
    genre: "Action RPG",
    category: "MMORPG",
    developer: "Smilegate RPG",
    publisher: "Amazon Games",
    release_date: "Feb 11, 2022",
    detail: "Embark on an odyssey for the Lost Ark in a vast, vibrant world: explore new lands, seek out lost treasures, and test yourself in thrilling action combat in this action-packed free-to-play RPG.",
    description: "Embark on an odyssey for the Lost Ark in a vast, vibrant world: explore new lands, seek out lost treasures, and test yourself in thrilling action combat. Define your fighting style with your class and advanced class, and customize your skills, weapons, and gear to bring your might to bear as you fight against hordes of enemies, colossal bosses, and dark forces seeking the power of the Ark in this action-packed free-to-play RPG.",
  )

  lostark.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainlostark.jpeg"),
                            filename: "mainlostark.jpeg")

  lostark.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1lostark.jpg"),
                             filename: "gameimage1lostark.jpg")

  lostark.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2lostark.jpg"),
                             filename: "gameimage2lostark.jpg")

  lostark.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3lostark.jpg"),
                             filename: "gameimage3lostark.jpg")

  lostark.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4lostark.jpg"),
                             filename: "gameimage4lostark.jpg")

  guiltygear = Game.create!(
    name: "GUILTY GEAR -STRIVE-",
    price: 39.99,
    genre: "2D Fighter",
    category: "Anime",
    developer: "Arc System Works",
    publisher: "Arc System Works",
    release_date: "Jun 11, 2021",
    detail: "The cutting-edge 2D/3D hybrid graphics pioneered in the Guilty Gear series have been raised to the next level in “GUILTY GEAR -STRIVE-“. The new artistic direction and improved character animations will go beyond anything you’ve seen before in a fighting game!",
    description: "Discover the Smell of the Game with Guilty Gear -Strive-! Immerse yourself in new gameplay mechanics designed to be simple and welcoming for fighting game newcomers, yet deep and creative for veterans. Ride the Fire into a heavy metal inspired alternate future full of over-the-top action, style and fun! Blazing!

    “Guilty Gear -Strive-“ is the latest entry in the critically acclaimed Guilty Gear fighting game franchise. Created by Daisuke Ishiwatari and developed by Arc System Works, “Guilty Gear -Strive-“ upholds the series’ reputation for a high octane soundtrack, groundbreaking hybrid 2D/3D cell-shaded graphics and intense, rewarding gameplay.",
  )

  guiltygear.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainguiltygear.jpeg"),
                               filename: "mainguiltygear.jpeg")

  guiltygear.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1guiltygear.jpg"),
                                filename: "gameimage1guiltygear.jpg")

  guiltygear.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2guiltygear.jpg"),
                                filename: "gameimage2guiltygear.jpg")

  guiltygear.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3guiltygear.jpg"),
                                filename: "gameimage3guiltygear.jpg")

  guiltygear.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4guiltygear.jpg"),
                                filename: "gameimage4guiltygear.jpg")

  escapesimulator = Game.create!(
    name: "Escape Simulator",
    price: 14.99,
    genre: "Puzzle",
    category: "Escape Room",
    developer: "Pine Studio",
    publisher: "Pine Studio",
    release_date: "Oct 19, 2021",
    detail: "First-person puzzler you can play solo or in an online co-op (best with 2-3 players, but playable with more). Explore a set of highly interactive escape rooms. Move furniture, pick up and examine everything, smash pots and break locks! Supports community rooms through the level editor.",
    description: "Escape Simulator is a first-person puzzler you can play solo or in an online co-op. Explore a growing set of highly interactive escape rooms. Move furniture, pick up and examine everything, smash pots and break locks! Supports community-made rooms through the level editor.",
  )

  escapesimulator.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainescapesimulator.jpeg"),
                                    filename: "mainescapesimulator.jpeg")

  escapesimulator.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1escapesimulator.jpg"),
                                     filename: "gameimage1escapesimulator.jpg")

  escapesimulator.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2escapesimulator.jpg"),
                                     filename: "gameimage2escapesimulator.jpg")

  escapesimulator.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3escapesimulator.jpg"),
                                     filename: "gameimage3escapesimulator.jpg")

  escapesimulator.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4escapesimulator.jpg"),
                                     filename: "gameimage4escapesimulator.jpg")

  tabletop = Game.create!(
    name: "Tabletop Simulator",
    price: 19.99,
    genre: "Tabletop",
    category: "Multiplayer",
    developer: "Berserk Games",
    publisher: "Berserk Games",
    release_date: "Jun 5, 2015",
    detail: "Tabletop Simulator is the only simulator where you can let your aggression out by flipping the table! There are no rules to follow: just you, a physics sandbox, and your friends. Make your own online board games or play the thousands of community created mods. Unlimited gaming possibilities!",
    description: "Create your own original games, import custom assets, automate games with scripting, set up complete RPG dungeons, manipulate the physics, create hinges & joints, and of course flip the table when you are losing the game. All with an easy to use system integrated with Steam Workshop. You can do anything you want in Tabletop Simulator. The possibilities are endless!",
  )

  tabletop.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maintabletop.jpeg"),
                             filename: "maintabletop.jpeg")

  tabletop.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1tabletop.jpg"),
                              filename: "gameimage1tabletop.jpg")

  tabletop.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2tabletop.jpg"),
                              filename: "gameimage2tabletop.jpg")

  tabletop.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3tabletop.jpg"),
                              filename: "gameimage3tabletop.jpg")

  tabletop.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4tabletop.jpg"),
                              filename: "gameimage4tabletop.jpg")

  golfwfriends = Game.create!(
    name: "Golf With Your Friends",
    price: 14.99,
    genre: "Casual",
    category: "Multiplayer",
    developer: "Blacklight Interactive, Team17",
    publisher: "Team17",
    release_date: "May 19, 2020",
    detail: "Why have friends if not to play Golf... With Your Friends! Nothing is out of bounds as you take on courses filled with fast paced, exciting, simultaneous mini golf for up to 12 players!",
    description: "Why have friends if not to play Golf... With Your Friends! Nothing is out of bounds as you take on courses filled with fast paced, exciting, simultaneous mini golf for up to 12 players!",
  )

  golfwfriends.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maingolfwfriends.jpeg"),
                                 filename: "maingolfwfriends.jpeg")

  golfwfriends.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1golfwfriends.jpg"),
                                  filename: "gameimage1golfwfriends.jpg")

  golfwfriends.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2golfwfriends.jpg"),
                                  filename: "gameimage2golfwfriends.jpg")

  golfwfriends.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3golfwfriends.jpg"),
                                  filename: "gameimage3golfwfriends.jpg")

  golfwfriends.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4golfwfriends.jpg"),
                                  filename: "gameimage4golfwfriends.jpg")

  backrooms = Game.create!(
    name: "Escape the Backrooms",
    price: 9.99,
    genre: "Horror",
    category: "Multiplayer",
    developer: "Fancy Games",
    publisher: "Fancy Games",
    release_date: "Aug 11, 2022",
    detail: "Escape the Backrooms is a 1-4 player co-op horror exploration game. Traverse through eerie backrooms levels while avoiding entities and other danger to try and escape. Free content updates with new levels and game modes keep the community rewarded.",
    description: "Explore the seemingly infinite expanse of eerily familiar levels in the backrooms based on the popular creepypasta lore. Each level features different ways to escape with danger along the way.",
  )

  backrooms.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainbackrooms.jpeg"),
                              filename: "mainbackrooms.jpeg")

  backrooms.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1backrooms.jpg"),
                               filename: "gameimage1backrooms.jpg")

  backrooms.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2backrooms.jpg"),
                               filename: "gameimage2backrooms.jpg")

  backrooms.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3backrooms.jpg"),
                               filename: "gameimage3backrooms.jpg")

  backrooms.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4backrooms.jpg"),
                               filename: "gameimage4backrooms.jpg")

  towerfantasy = Game.create!(
    name: "Tower of Fantasy",
    price: 0,
    genre: "Action",
    category: "Anime",
    developer: "Hotta Studio",
    publisher: "Level Infinite",
    release_date: "Oct 20, 2022",
    detail: "Embark together on your fantasy adventure! Set hundreds of years in the future on the distant planet of Aida, the shared open-world RPG, anime-infused sci-fi adventure Tower of Fantasy now is officially available on Steam.",
    description: "Embark together on your fantasy adventure!

    Set hundreds of years in the future on the distant planet of Aida, the shared open-world MMORPG, anime-infused sci-fi adventure Tower of Fantasy from developer Hotta Studio and publisher Level Infinite, is now available on PC and mobile platforms globally. Players will be able to experience an anime-inspired post-apocalyptic sci-fi art style, freeform character development, and exciting combat through thrilling battles and exciting open-world exploration.
    
    In Tower of Fantasy, dwindling resources and a lack of energy have forced mankind to leave earth and migrate to Aida, a lush and habitable alien world. There, they observed the comet Mara and discovered an unknown but powerful energy called 'Omnium' contained in it. They built the Omnium Tower to capture Mara, but due to the influence of Omnium radiation, a catastrophic disaster occurred on their new homeworld.",
  )

  towerfantasy.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maintowerfantasy.jpeg"),
                                 filename: "maintowerfantasy.jpeg")

  towerfantasy.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1towerfantasy.jpg"),
                                  filename: "gameimage1towerfantasy.jpg")

  towerfantasy.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2towerfantasy.jpg"),
                                  filename: "gameimage2towerfantasy.jpg")

  towerfantasy.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3towerfantasy.jpg"),
                                  filename: "gameimage3towerfantasy.jpg")

  towerfantasy.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4towerfantasy.jpg"),
                                  filename: "gameimage4towerfantasy.jpg")

  gta5 = Game.create!(
    name: "Grand Theft Auto V",
    price: 29.98,
    genre: "Mature",
    category: "Open World",
    developer: "Rockstar North",
    publisher: "Rockstar Games",
    release_date: "Apr 14, 2015",
    detail: "Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.",
    description: "When a young street hustler, a retired bank robber and a terrifying psychopath find themselves entangled with some of the most frightening and deranged elements of the criminal underworld, the U.S. government and the entertainment industry, they must pull off a series of dangerous heists to survive in a ruthless city in which they can trust nobody, least of all each other.

    Grand Theft Auto V for PC offers players the option to explore the award-winning world of Los Santos and Blaine County in resolutions of up to 4k and beyond, as well as the chance to experience the game running at 60 frames per second.",
  )

  gta5.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maingta5.jpeg"),
                         filename: "maingta5.jpeg")

  gta5.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1gta5.jpg"),
                          filename: "gameimage1gta5.jpg")

  gta5.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2gta5.jpg"),
                          filename: "gameimage2gta5.jpg")

  gta5.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3gta5.jpg"),
                          filename: "gameimage3gta5.jpg")

  gta5.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4gta5.jpg"),
                          filename: "gameimage4gta5.jpg")

  rust = Game.create!(
    name: "Rust",
    price: 39.99,
    genre: "Survival",
    category: "Open World",
    developer: "Facepunch Studios",
    publisher: "Facepunch Studios",
    release_date: "Feb 8, 2018",
    detail: "The only aim in Rust is to survive. Everything wants you to die - the island’s wildlife and other inhabitants, the environment, other survivors. Do whatever it takes to last another night.",
    description: "The only aim in Rust is to survive. Everything wants you to die - the island’s wildlife and other inhabitants, the environment, other survivors. Do whatever it takes to last another night.",
  )

  rust.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainrust.jpeg"),
                         filename: "mainrust.jpeg")

  rust.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1rust.jpg"),
                          filename: "gameimage1rust.jpg")

  rust.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2rust.jpg"),
                          filename: "gameimage2rust.jpg")

  rust.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3rust.jpg"),
                          filename: "gameimage3rust.jpg")

  rust.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4rust.jpg"),
                          filename: "gameimage4rust.jpg")

  terraria = Game.create!(
    name: "Terraria",
    price: 9.99,
    genre: "Sandbox",
    category: "Open World",
    developer: "Re-Logic",
    publisher: "Re-Logic",
    release_date: "May 16, 2011",
    detail: "Dig, fight, explore, build! Nothing is impossible in this action-packed adventure game. Four Pack also available!",
    description: "Dig, Fight, Explore, Build: The very world is at your fingertips as you fight for survival, fortune, and glory. Will you delve deep into cavernous expanses in search of treasure and raw materials with which to craft ever-evolving gear, machinery, and aesthetics? Perhaps you will choose instead to seek out ever-greater foes to test your mettle in combat? Maybe you will decide to construct your own city to house the host of mysterious allies you may encounter along your travels?",
  )

  terraria.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainterraria.jpeg"),
                             filename: "mainterraria.jpeg")

  terraria.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1terraria.jpg"),
                              filename: "gameimage1terraria.jpg")

  terraria.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2terraria.jpg"),
                              filename: "gameimage2terraria.jpg")

  terraria.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3terraria.jpg"),
                              filename: "gameimage3terraria.jpg")

  terraria.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4terraria.jpg"),
                              filename: "gameimage4terraria.jpg")

  pummel = Game.create!(
    name: "Pummel Party",
    price: 14.99,
    genre: "Funny",
    category: "Multplayer",
    developer: "Rebuilt Games",
    publisher: "Rebuilt Games",
    release_date: "Sep 20, 2018",
    detail: "Pummel Party is a 4-8 player online and local-multiplayer party game. Pummel friends or AI using a wide array of absurd items in the board mode and compete to destroy friendships in the unique collection of minigames.",
    description: "Pummel Party is a 4-8 player online and local-multiplayer party game. Pummel friends or AI using a wide array of absurd items in the board mode and compete to destroy friendships in the entertaining collection of minigames.",
  )

  pummel.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainpummelparty.jpeg"),
                           filename: "mainpummelparty.jpeg")

  pummel.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1pummel.jpg"),
                            filename: "gameimage1pummel.jpg")

  pummel.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2pummel.jpg"),
                            filename: "gameimage2pummel.jpg")

  pummel.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3pummel.jpg"),
                            filename: "gameimage3pummel.jpg")

  pummel.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4pummel.jpg"),
                            filename: "gameimage4pummel.jpg")

  dokidoki = Game.create!(
    name: "Doki Doki Literature Club!",
    price: 0,
    genre: "Psychological Horror",
    category: "Anime",
    developer: "Team Salvato",
    publisher: "Team Salvato",
    release_date: "Sep 22, 2017",
    detail: "The Literature Club is full of cute girls! Will you write the way into their heart? This game is not suitable for children or those who are easily disturbed.",
    description: "Hi, Monika here!
    Welcome to the Literature Club! It's always been a dream of mine to make something special out of the things I love. Now that you're a club member, you can help me make that dream come true in this cute game!
    
    Every day is full of chit-chat and fun activities with all of my adorable and unique club members:
    
    Sayori, the youthful bundle of sunshine who values happiness the most;
    Natsuki, the deceivingly cute girl who packs an assertive punch;
    Yuri, the timid and mysterious one who finds comfort in the world of books;
    ...And, of course, Monika, the leader of the club! That's me!
    
    I'm super excited for you to make friends with everyone and help the Literature Club become a more intimate place for all my members. But I can tell already that you're a sweetheart—will you promise to spend the most time with me? ♥
    
    This game is not suitable for children
    or those who are easily disturbed.",
  )

  dokidoki.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maindokidoki.jpeg"),
                             filename: "maindokidoki.jpeg")

  dokidoki.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1dokidoki.jpg"),
                              filename: "gameimage1dokidoki.jpg")

  dokidoki.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2dokidoki.jpg"),
                              filename: "gameimage2dokidoki.jpg")

  dokidoki.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3dokidoki.jpg"),
                              filename: "gameimage3dokidoki.jpg")

  dokidoki.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4dokidoki.jpg"),
                              filename: "gameimage4dokidoki.jpg")

  aimlab = Game.create!(
    name: "Aim Lab",
    price: 0,
    genre: "FPS",
    category: "Shooter",
    developer: "Statespace",
    publisher: "Statespace",
    release_date: "Feb 7, 2018",
    detail: "Aim Lab is the aim trainer of choice for over 20 Million players, from beginners to esports pros. Our unique aim analysis optimizes your gameplay, targets your weaknesses & builds key skills for any FPS/TPS game, all for free! Time to warm up with our unlimited scenarios & rank up in-game!",
    description: "Looking to improve as an FPS player?
    Aim Lab has been developed as your personal trainer to help you get better - in more games - through curated aim training scenarios, improving your core FPS skills including flicking, tracking, speed, perception & cognition through detailed aim analysis feedback which guides you on quick improvements. Aim Lab is regularly updated with new features to support more games and is a must for any players, from beginner to pro, to gain a competitive edge.",
  )

  aimlab.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainaimlab.jpeg"),
                           filename: "mainaimlab.jpeg")

  aimlab.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1aimlab.jpg"),
                            filename: "gameimage1aimlab.jpg")

  aimlab.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2aimlab.jpg"),
                            filename: "gameimage2aimlab.jpg")

  aimlab.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3aimlab.jpg"),
                            filename: "gameimage3aimlab.jpg")

  aimlab.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4aimlab.jpg"),
                            filename: "gameimage4aimlab.jpg")

  residentevil2 = Game.create!(
    name: "Resident Evil 2",
    price: 39.99,
    genre: "Horror",
    category: "Remake",
    developer: "CAPCOM Co., Ltd.",
    publisher: "CAPCOM Co., Ltd.",
    release_date: "Jan 25, 2019",
    detail: "A deadly virus engulfs the residents of Raccoon City in September of 1998, plunging the city into chaos as flesh eating zombies roam the streets for survivors. An unparalleled adrenaline rush, gripping storyline, and unimaginable horrors await you. Witness the return of Resident Evil 2.",
    description: "The genre-defining masterpiece Resident Evil 2 returns, completely rebuilt from the ground up for a deeper narrative experience. Using Capcom’s proprietary RE Engine, Resident Evil 2 offers a fresh take on the classic survival horror saga with breathtakingly realistic visuals, heart-pounding immersive audio, a new over-the-shoulder camera, and modernized controls on top of gameplay modes from the original game.

    In Resident Evil 2, the classic action, tense exploration, and puzzle solving gameplay that defined the Resident Evil series returns. Players join rookie police officer Leon Kennedy and college student Claire Redfield, who are thrust together by a disastrous outbreak in Raccoon City that transformed its population into deadly zombies. Both Leon and Claire have their own separate playable campaigns, allowing players to see the story from both characters’ perspectives. The fate of these two fan favorite characters is in players hands as they work together to survive and get to the bottom of what is behind the terrifying attack on the city. Will they make it out alive?",
  )

  residentevil2.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainresidentevil2.jpeg"),
                                  filename: "mainresidentevil2.jpeg")

  residentevil2.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1residentevil2.jpg"),
                                   filename: "gameimage1residentevil2.jpg")

  residentevil2.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2residentevil2.jpg"),
                                   filename: "gameimage2residentevil2.jpg")

  residentevil2.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3residentevil2.jpg"),
                                   filename: "gameimage3residentevil2.jpg")

  residentevil2.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4residentevil2.jpg"),
                                   filename: "gameimage4residentevil2.jpg")

  residentevil3 = Game.create!(
    name: "Resident Evil 3",
    price: 39.99,
    genre: "Horror",
    category: "Remake",
    developer: "CAPCOM Co., Ltd.",
    publisher: "CAPCOM Co., Ltd.",
    release_date: "Apr 2, 2020",
    detail: "Jill Valentine is one of the last remaining people in Raccoon City to witness the atrocities Umbrella performed. To stop her, Umbrella unleashes their ultimate secret weapon: Nemesis! Also includes Resident Evil Resistance, a new 1 vs 4 online multiplayer game set in the Resident Evil universe.",
    description: "Jill Valentine is one of the last remaining people in Raccoon City to witness the atrocities Umbrella performed. To stop her, Umbrella unleashes their ultimate secret weapon; Nemesis!

    Also includes Resident Evil Resistance, a new 1 vs 4 online multiplayer game set in the Resident Evil universe where four survivors face-off against a sinister Mastermind.",
  )

  residentevil3.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainresidentevil3.jpeg"),
                                  filename: "mainresidentevil3.jpeg")

  residentevil3.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1residentevil3.jpg"),
                                   filename: "gameimage1residentevil3.jpg")

  residentevil3.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2residentevil3.jpg"),
                                   filename: "gameimage2residentevil3.jpg")

  residentevil3.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3residentevil3.jpg"),
                                   filename: "gameimage3residentevil3.jpg")

  residentevil3.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4residentevil3.jpg"),
                                   filename: "gameimage4residentevil3.jpg")

  residentevil4 = Game.create!(
    name: "Resident Evil 4",
    price: 59.99,
    genre: "Horror",
    category: "Remake",
    developer: "CAPCOM Co., Ltd.",
    publisher: "CAPCOM Co., Ltd.",
    release_date: "Mar 23, 2023",
    detail: "Survival is just the beginning. Six years have passed since the biological disaster in Raccoon City. Leon S. Kennedy, one of the survivors, tracks the president's kidnapped daughter to a secluded European village, where there is something terribly wrong with the locals.",
    description: "Survival is just the beginning.

    Six years have passed since the biological disaster in Raccoon City.
    Agent Leon S. Kennedy, one of the survivors of the incident, has been sent to rescue the president's kidnapped daughter.
    He tracks her to a secluded European village, where there is something terribly wrong with the locals.
    And the curtain rises on this story of daring rescue and grueling horror where life and death, terror and catharsis intersect.
    
    Featuring modernized gameplay, a reimagined storyline, and vividly detailed graphics,
    Resident Evil 4 marks the rebirth of an industry juggernaut.
    
    Relive the nightmare that revolutionized survival horror.",
  )

  residentevil4.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainresidentevil4.jpeg"),
                                  filename: "mainresidentevil4.jpeg")

  residentevil4.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1residentevil4.jpg"),
                                   filename: "gameimage1residentevil4.jpg")

  residentevil4.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2residentevil4.jpg"),
                                   filename: "gameimage2residentevil4.jpg")

  residentevil4.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3residentevil4.jpg"),
                                   filename: "gameimage3residentevil4.jpg")

  residentevil4.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4residentevil4.jpg"),
                                   filename: "gameimage4residentevil4.jpg")

  residentevilvillage = Game.create!(
    name: "Resident Evil Village",
    price: 39.99,
    genre: "Horror",
    category: "Singleplayer",
    developer: "CAPCOM Co., Ltd.",
    publisher: "CAPCOM Co., Ltd.",
    release_date: "May 7, 2021",
    detail: "Experience survival horror like never before in the 8th major installment in the Resident Evil franchise - Resident Evil Village. With detailed graphics, intense first-person action and masterful storytelling, the terror has never felt more realistic.",
    description: "Experience survival horror like never before in the eighth major installment in the storied Resident Evil franchise - Resident Evil Village.

    Set a few years after the horrifying events in the critically acclaimed Resident Evil 7 biohazard, the all-new storyline begins with Ethan Winters and his wife Mia living peacefully in a new location, free from their past nightmares. Just as they are building their new life together, tragedy befalls them once again.",
  )

  residentevilvillage.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainresidentevilvillage.jpeg"),
                                        filename: "mainresidentevilvillage.jpeg")

  residentevilvillage.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1residentevilvillage.jpg"),
                                         filename: "gameimage1residentevilvillage.jpg")

  residentevilvillage.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2residentevilvillage.jpg"),
                                         filename: "gameimage2residentevilvillage.jpg")

  residentevilvillage.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3residentevilvillage.jpg"),
                                         filename: "gameimage3residentevilvillage.jpg")

  residentevilvillage.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4residentevilvillage.jpg"),
                                         filename: "gameimage4residentevilvillage.jpg")

  back4blood = Game.create!(
    name: "Back 4 Blood",
    price: 59.99,
    genre: "Shooter",
    category: "Multiplayer",
    developer: "Turtle Rock Studios",
    publisher: "Warner Bros. Games",
    release_date: "Oct 12, 2021",
    detail: "Back 4 Blood is a thrilling cooperative first-person shooter from the creators of the critically acclaimed Left 4 Dead franchise. Experience the intense 4 player co-op narrative campaign, competitive multiplayer as human or Ridden, and frenetic gameplay that keeps you in the action.",
    description: "Back 4 Blood is a thrilling cooperative first-person shooter from the creators of the critically acclaimed Left 4 Dead franchise. You are at the center of a war against the Ridden. These once-human hosts of a deadly parasite have turned into terrifying creatures bent on devouring what remains of civilization. With humanity's extinction on the line, it's up to you and your friends to take the fight to the enemy, eradicate the Ridden, and reclaim the world.",
  )

  back4blood.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainback4blood.jpeg"),
                               filename: "mainback4blood.jpeg")

  back4blood.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1back4blood.jpg"),
                                filename: "gameimage1back4blood.jpg")

  back4blood.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2back4blood.jpg"),
                                filename: "gameimage2back4blood.jpg")

  back4blood.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3back4blood.jpg"),
                                filename: "gameimage3back4blood.jpg")

  back4blood.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4back4blood.jpg"),
                                filename: "gameimage4back4blood.jpg")

  gunfirereborn = Game.create!(
    name: "Gunfire Reborn",
    price: 19.99,
    genre: "Roguelike",
    category: "Indie",
    developer: "Duoyi Games",
    publisher: "Duoyi Games",
    release_date: "Nov 17, 2021",
    detail: "Gunfire Reborn is a level-based adventure game featuring FPS, Roguelite and RPG. Players can control heroes with various abilities to experience diverse Build gameplay, use various weapons to explore procedurally-generated levels. You can play the game alone, or join 4-player coop.",
    description: "Gunfire Reborn is an adventure level-based game featuring FPS, roguelite, and RPG elements. Players can control unique heroes—each with different abilities—as they adventure through procedurally-generated levels and pick up randomly-dropped weapons. You can play Gunfire Reborn alone or cooperatively with up to three other players (4-player co-op).
    Every level is random; each new restart is a brand-new experience. You will meet different heroes and experience new weapons, items, checkpoints, and unique combat rhythms throughout the game",
  )

  gunfirereborn.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maingunfirereborn.jpeg"),
                                  filename: "maingunfirereborn.jpeg")

  gunfirereborn.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1gunfirereborn.jpg"),
                                   filename: "gameimage1gunfirereborn.jpg")

  gunfirereborn.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2gunfirereborn.jpg"),
                                   filename: "gameimage2gunfirereborn.jpg")

  gunfirereborn.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3gunfirereborn.jpg"),
                                   filename: "gameimage3gunfirereborn.jpg")

  gunfirereborn.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4gunfirereborn.jpg"),
                                   filename: "gameimage4gunfirereborn.jpg")

  nierautomata = Game.create!(
    name: "NieR:Automata™",
    price: 39.99,
    genre: "Story Rich",
    category: "Female Protagonist",
    developer: "Square Enix, PlatinumGames Inc.",
    publisher: " Square Enix",
    release_date: "Mar 17, 2017",
    detail: "NieR: Automata tells the story of androids 2B, 9S and A2 and their battle to reclaim the machine-driven dystopia overrun by powerful machines.",
    description: "NieR: Automata tells the story of androids 2B, 9S and A2 and their battle to reclaim the machine-driven dystopia overrun by powerful machines.

    Humanity has been driven from the Earth by mechanical beings from another world. In a final effort to take back the planet, the human resistance sends a force of android soldiers to destroy the invaders. Now, a war between machines and androids rages on... A war that could soon unveil a long-forgotten truth of the world.",
  )

  nierautomata.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainnierautomata.jpeg"),
                                 filename: "mainnierautomata.jpeg")

  nierautomata.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1nierautomata.jpg"),
                                  filename: "gameimage1nierautomata.jpg")

  nierautomata.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2nierautomata.jpg"),
                                  filename: "gameimage2nierautomata.jpg")

  nierautomata.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3nierautomata.jpg"),
                                  filename: "gameimage3nierautomata.jpg")

  nierautomata.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4nierautomata.jpg"),
                                  filename: "gameimage4nierautomata.jpg")

  codevein = Game.create!(
    name: "CODE VEIN",
    price: 59.99,
    genre: "Souls-like",
    category: "Anime",
    developer: "Bandai Namco Studios",
    publisher: "Bandai Namco Studios",
    release_date: "Sep 26, 2019",
    detail: "In the face of certain death, we rise. Team up and embark on a journey to the ends of hell to unlock your past and escape your living nightmare in CODE VEIN.",
    description: "RISE TOGETHER
    Team up with an AI partner or a friend in co-op multiplayer and venture out into a world of destruction in this story driven connected dungeon experience. Use your combined strength to coordinate your approach and defend each other from surprise attacks or tackle overpowered enemies.
    
    GREATER CHALLENGES BRING GREATER REWARDS
    Acquire new gear, level up your character, and become more powerful to rise up against the Lost. From new players to seasoned action game veterans, the challenges in CODE VEIN will keep you coming back for more.
    
    CUSTOMIZE YOUR REVENANT
    Choose from various weapons such as bayonets, axes, spears, and more. Enhance your character’s abilities with powerful Blood Code enhancements, each with access to various “Gifts” that can increase your strength, weaken enemies, and can allow you to utilize new weapon abilities or access overpowered attacks. Finish off your opponents with your Blood Veil, powerful blood draining tools, each with their own unique visual and attack style that opens up a myriad of new combat strategies.",
  )

  codevein.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/maincodevein.jpeg"),
                             filename: "maincodevein.jpeg")

  codevein.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1codevein.jpg"),
                              filename: "gameimage1codevein.jpg")

  codevein.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2codevein.jpg"),
                              filename: "gameimage2codevein.jpg")

  codevein.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3codevein.jpg"),
                              filename: "gameimage3codevein.jpg")

  codevein.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4codevein.jpg"),
                              filename: "gameimage4codevein.jpg")

  sekiro = Game.create!(
    name: "Sekiro™: Shadows Die Twice - GOTY Edition",
    price: 59.99,
    genre: "Souls-like",
    category: "Singleplayer",
    developer: "FromSoftware",
    publisher: "Activision",
    release_date: "Mar 21, 2019",
    detail: "Game of the Year - The Game Awards 2019 Best Action Game of 2019 - IGN Carve your own clever path to vengeance in the award winning adventure from developer FromSoftware, creators of Bloodborne and the Dark Souls series. Take Revenge. Restore Your Honor. Kill Ingeniously.",
    description: "This Game of the Year Edition now includes bonus content*:

    - Reflection and Gauntlet of Strength - new boss challenge modes
    - Remnants - leave messages and recordings of your actions that other players can view and rate
    - 3 unlockable cosmetic skins
    
    Game of the Year - The Game Awards 2019
    Best Action Game of 2019 - IGN
    Over 50 awards and nominations
    
    Carve your own clever path to vengeance in the critically acclaimed adventure from developer FromSoftware, creators of the Dark Souls series.
    
    In Sekiro™: Shadows Die Twice you are the 'one-armed wolf', a disgraced and disfigured warrior rescued from the brink of death. Bound to protect a young lord who is the descendant of an ancient bloodline, you become the target of many vicious enemies, including the dangerous Ashina clan. When the young lord is captured, nothing will stop you on a perilous quest to regain your honor, not even death itself.",
  )

  sekiro.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainsekiro.jpeg"),
                           filename: "mainsekiro.jpeg")

  sekiro.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1sekiro.jpg"),
                            filename: "gameimage1sekiro.jpg")

  sekiro.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2sekiro.jpg"),
                            filename: "gameimage2sekiro.jpg")

  sekiro.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3sekiro.jpg"),
                            filename: "gameimage3sekiro.jpg")

  sekiro.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4sekiro.jpg"),
                            filename: "gameimage4sekiro.jpg")

  riskofrain2 = Game.create!(
    name: "Risk of Rain 2",
    price: 24.99,
    genre: "Action Roguelike",
    category: "Multiplayer",
    developer: "Hopoo Games",
    publisher: "Gearbox Publishing",
    release_date: "Aug 11, 2020",
    detail: "Escape a chaotic alien planet by fighting through hordes of frenzied monsters – with your friends, or on your own. Combine loot in surprising ways and master each character until you become the havoc you feared upon your first crash landing.",
    description: "SURVIVE AN ALIEN PLANET
    Over a dozen handcrafted locales await, each packed with challenging monsters and enormous bosses that oppose your continued existence. Fight your way to the final boss and escape or continue your run indefinitely to see just how long you can survive. A unique scaling system means both you and your foes limitlessly increase in power over the course of a game.",
  )

  riskofrain2.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainriskofrain2.jpeg"),
                                filename: "mainriskofrain2.jpeg")

  riskofrain2.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1riskofrain2.jpg"),
                                 filename: "gameimage1riskofrain2.jpg")

  riskofrain2.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2riskofrain2.jpg"),
                                 filename: "gameimage2riskofrain2.jpg")

  riskofrain2.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3riskofrain2.jpg"),
                                 filename: "gameimage3riskofrain2.jpg")

  riskofrain2.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4riskofrain2.jpg"),
                                 filename: "gameimage4riskofrain2.jpg")

  raft = Game.create!(
    name: "Raft",
    price: 19.99,
    genre: "Survival",
    category: "Multiplayer",
    developer: "Redbeet Interactive",
    publisher: "Axolot Games",
    release_date: "Jun 20, 2022",
    detail: "Raft throws you and your friends into an epic oceanic adventure! Alone or together, players battle to survive a perilous voyage across a vast sea! Gather debris, scavenge reefs and build your own floating home, but be wary of the man-eating sharks!",
    description: "By yourself or with friends, your mission is to survive an epic oceanic adventure across
    a perilous sea! Gather debris to survive, expand your raft and set sail towards forgotten and dangerous islands!
    
    
    Trapped on a small raft with nothing but a hook made of old plastic, players awake on a vast,
    blue ocean totally alone and with no land in sight! With a dry throat and an empty stomach,
    survival will not be easy!
    
    Raft throws you and your friends into an epic adventure out on the big open sea, with the
    objective to stay alive, gather resources and build yourself a floating home worthy of
    survival.
    
    Resources are tough to come by at sea: Players will have to make sure to catch whatever debris floats by using their trusty hook and when possible, scavenge the reefs beneath the waves and the islands above.
    However, thirst and hunger is not the only danger in the ocean… watch out for the man-
    eating shark determined to end your voyage!",
  )

  raft.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainraft.jpeg"),
                         filename: "mainraft.jpeg")

  raft.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1raft.jpg"),
                          filename: "gameimage1raft.jpg")

  raft.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2raft.jpg"),
                          filename: "gameimage2raft.jpg")

  raft.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3raft.jpg"),
                          filename: "gameimage3raft.jpg")

  raft.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4raft.jpg"),
                          filename: "gameimage4raft.jpg")

  stray = Game.create!(
    name: "Stray",
    price: 29.99,
    genre: "Cats",
    category: "Cyberpunk",
    developer: "BlueTwelve Studio",
    publisher: "Annapurna Interactive",
    release_date: "Jul 19, 2022",
    detail: "Lost, alone and separated from family, a stray cat must untangle an ancient mystery to escape a long-forgotten cybercity and find their way home.",
    description: "Lost, alone and separated from family, a stray cat must untangle an ancient mystery to escape a long-forgotten city.

    Stray is a third-person cat adventure game set amidst the detailed, neon-lit alleys of a decaying cybercity and the murky environments of its seedy underbelly. Roam surroundings high and low, defend against unforeseen threats and solve the mysteries of this unwelcoming place inhabited by curious droids and dangerous creatures.
    
    See the world through the eyes of a cat and interact with the environment in playful ways. Be stealthy, nimble, silly, and sometimes as annoying as possible with the strange inhabitants of this mysterious world.
    
    Along the way, the cat befriends a small flying drone, known only as B-12. With the help of this newfound companion, the duo must find a way out.
    
    Stray is developed by BlueTwelve Studio, a small team from the south of France mostly made up of cats and a handful of humans.",
  )

  stray.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainstray.jpeg"),
                          filename: "mainstray.jpeg")

  stray.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1stray.jpg"),
                           filename: "gameimage1stray.jpg")

  stray.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2stray.jpg"),
                           filename: "gameimage2stray.jpg")

  stray.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3stray.jpg"),
                           filename: "gameimage3stray.jpg")

  stray.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4stray.jpg"),
                           filename: "gameimage4stray.jpg")

  finalfantasy = Game.create!(
    name: "FINAL FANTASY VII REMAKE INTERGRADE",
    price: 69.99,
    genre: "RPG",
    category: "JRPG",
    developer: "Square Enix",
    publisher: "Square Enix",
    release_date: "Jun 17, 2022",
    detail: "Cloud Strife, an ex-SOLDIER operative, descends on the mako-powered city of Midgar. The world of the timeless classic FINAL FANTASY VII is reborn, using cutting-edge graphics technology, a new battle system and an additional adventure featuring Yuffie Kisaragi.",
    description: "FINAL FANTASY VII REMAKE is a bold reimagining of the original FINAL FANTASY VII, originally released in 1997, developed under the guidance of the original key developers.
    This critically-acclaimed game, which mixes traditional command-based combat and real-time action, makes its Steam debut along with FF7R EPISODE INTERmission─a new story arc featuring Yuffie Kisaragi.",
  )

  finalfantasy.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainfinalfantasy.jpeg"),
                                 filename: "mainfinalfantasy.jpeg")

  finalfantasy.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1finalfantasy.jpg"),
                                  filename: "gameimage1finalfantasy.jpg")

  finalfantasy.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2finalfantasy.jpg"),
                                  filename: "gameimage2finalfantasy.jpg")

  finalfantasy.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3finalfantasy.jpg"),
                                  filename: "gameimage3finalfantasy.jpg")

  finalfantasy.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4finalfantasy.jpg"),
                                  filename: "gameimage4finalfantasy.jpg")

  monsterhunter = Game.create!(
    name: "Monster Hunter: World",
    price: 29.99,
    genre: "RPG",
    category: "Open World",
    developer: "CAPCOM Co., Ltd.",
    publisher: "CAPCOM Co., Ltd.",
    release_date: "Aug 9, 2018",
    detail: "Welcome to a new world! In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.",
    description: "Welcome to a new world! Take on the role of a hunter and slay ferocious monsters in a living, breathing ecosystem where you can use the landscape and its diverse inhabitants to get the upper hand. Hunt alone or in co-op with up to three other players, and use materials collected from fallen foes to craft new gear and take on even bigger, badder beasts!
    INTRODUCTION
    Overview
    Battle gigantic monsters in epic locales.
    
    As a hunter, you'll take on quests to hunt monsters in a variety of habitats.
    Take down these monsters and receive materials that you can use to create stronger weapons and armor in order to hunt even more dangerous monsters.
    
    In Monster Hunter: World, the latest installment in the series, you can enjoy the ultimate hunting experience, using everything at your disposal to hunt monsters in a new world teeming with surprises and excitement.",
  )

  monsterhunter.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainmonsterhunter.jpeg"),
                                  filename: "mainmonsterhunter.jpeg")

  monsterhunter.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1monsterhunter.jpg"),
                                   filename: "gameimage1monsterhunter.jpg")

  monsterhunter.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2monsterhunter.jpg"),
                                   filename: "gameimage2monsterhunter.jpg")

  monsterhunter.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3monsterhunter.jpg"),
                                   filename: "gameimage3monsterhunter.jpg")

  monsterhunter.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4monsterhunter.jpg"),
                                   filename: "gameimage4monsterhunter.jpg")

  persona4 = Game.create!(
    name: "Persona 4 Golden",
    price: 19.99,
    genre: "Story Rich",
    category: "JRPG",
    developer: "ATLUS",
    publisher: "SEGA",
    release_date: "Jun 13, 2020",
    detail: "A coming of age story that sets the protagonist and his friends on a journey kickstarted by a chain of serial murders.",
    description: "Inaba—a quiet town in rural Japan sets the scene for budding adolescence in Persona 4 Golden.

    A coming of age story that sets the protagonist and his friends on a journey kickstarted by a chain of serial murders. Explore meeting kindred spirits, feelings of belonging, and even confronting the darker sides of one’s self.",
  )

  persona4.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainpersona4.jpeg"),
                             filename: "mainpersona4.jpeg")

  persona4.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1persona4.jpg"),
                              filename: "gameimage1persona4.jpg")

  persona4.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2persona4.jpg"),
                              filename: "gameimage2persona4.jpg")

  persona4.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3persona4.jpg"),
                              filename: "gameimage3persona4.jpg")

  persona4.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4persona4.jpg"),
                              filename: "gameimage4persona4.jpg")

  persona3 = Game.create!(
    name: "Persona 3 Portable",
    price: 19.99,
    genre: "Story Rich",
    category: "JRPG",
    developer: "ATLUS",
    publisher: "SEGA",
    release_date: "Jan 19, 2023",
    detail: "If I say there’s an hour “hidden” between one day and the next... would you believe me? Master the power of the heart, Persona, and uncover the tragic truth of the Dark Hour.",
    description: "Experience the iconic, critically acclaimed RPG that reinvented the Persona series, Persona 3 Portable, now newly remastered for modern platforms.Shortly after transferring to Gekkoukan High School, the protagonist encounters the 'Dark Hour.' Unfamiliar stillness swallows the city, people turn into eerie coffins, and otherworldly monsters called Shadows swarm. When they are attacked by one of these Shadows, and all hope seems lost, the power of the heart, their Persona is awakened.",
  )

  persona3.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainpersona3.jpeg"),
                             filename: "mainpersona3.jpeg")

  persona3.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1persona3.jpg"),
                              filename: "gameimage1persona3.jpg")

  persona3.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2persona3.jpg"),
                              filename: "gameimage2persona3.jpg")

  persona3.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3persona3.jpg"),
                              filename: "gameimage3persona3.jpg")

  persona3.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4persona3.jpg"),
                              filename: "gameimage4persona3.jpg")

  battlefield = Game.create!(
    name: "Battlefield™ V",
    price: 49.99,
    genre: "FPS",
    category: "Multiplayer",
    developer: "DICE",
    publisher: "Electronic Arts",
    release_date: "Nov 9, 2018",
    detail: "This is the ultimate Battlefield V experience. Enter mankind’s greatest conflict with the complete arsenal of weapons, vehicles, and gadgets plus the best customization content of Year 1 and 2.",
    description: "This is the ultimate Battlefield V experience. Enter mankind’s greatest conflict across land, air, and sea with all gameplay content unlocked from the get-go. Choose from the complete arsenal of weapons, vehicles, and gadgets, and immerse yourself in the hard-fought battles of World War II. Stand out on the battlefield with the complete roster of Elites and the best customization content of Year 1 and Year 2.",
  )

  battlefield.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainbattlefield.jpeg"),
                                filename: "mainbattlefield.jpeg")

  battlefield.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1battlefield.jpg"),
                                 filename: "gameimage1battlefield.jpg")

  battlefield.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2battlefield.jpg"),
                                 filename: "gameimage2battlefield.jpg")

  battlefield.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3battlefield.jpg"),
                                 filename: "gameimage3battlefield.jpg")

  battlefield.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4battlefield.jpg"),
                                 filename: "gameimage4battlefield.jpg")

  ittakestwo = Game.create!(
    name: "It Takes Two",
    price: 39.99,
    genre: "Split Screen",
    category: "Multiplayer",
    developer: "Hazelight",
    publisher: "Electronic Arts",
    release_date: "Mar 26, 2021",
    detail: "Embark on the craziest journey of your life in It Takes Two. Invite a friend to join for free with Friend’s Pass and work together across a huge variety of gleefully disruptive gameplay challenges. Winner of GAME OF THE YEAR at the Game Awards 2021.",
    description: "Embark on the craziest journey of your life in It Takes Two, a genre-bending platform adventure created purely for co-op. Invite a friend to join for free with Friend’s Pass and work together across a huge variety of gleefully disruptive gameplay challenges. Play as the clashing couple Cody and May, two humans turned into dolls by a magic spell. Together, trapped in a fantastical world where the unpredictable hides around every corner, they are reluctantly challenged with saving their fractured relationship.

    Master unique and connected character abilities in every new level. Help each other across an abundance of unexpected obstacles and laugh-out-loud moments. Kick gangster squirrels’ furry tails, pilot a pair of underpants, DJ a buzzing night club, and bobsleigh through a magical snow globe. Embrace a heartfelt and hilarious story where narrative and gameplay weave into a uniquely metaphorical experience.
    
    It Takes Two is developed by the award-winning studio Hazelight, the industry leader of cooperative play. They’re about to take you on a wild and wondrous ride where only one thing is for certain: we’re better together.",
  )

  ittakestwo.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainittakestwo.jpeg"),
                               filename: "mainittakestwo.jpeg")

  ittakestwo.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1ittakestwo.jpg"),
                                filename: "gameimage1ittakestwo.jpg")

  ittakestwo.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2ittakestwo.jpg"),
                                filename: "gameimage2ittakestwo.jpg")

  ittakestwo.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3ittakestwo.jpg"),
                                filename: "gameimage3ittakestwo.jpg")

  ittakestwo.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4ittakestwo.jpg"),
                                filename: "gameimage4ittakestwo.jpg")

  vrising = Game.create!(
    name: "V Rising",
    price: 19.99,
    genre: "Vampire",
    category: "Open World",
    developer: "Stunlock Studios",
    publisher: "Stunlock Studios",
    release_date: "May 17, 2022",
    detail: "Awaken as a vampire. Hunt for blood in nearby settlements to regain your strength and evade the scorching sun to survive. Raise your castle and thrive in an ever-changing open world full of mystery. Gain allies online and conquer the land of the living.",
    description: "A Vampire Survival Experience

    Awaken as a weakened vampire after centuries of slumber. Hunt for blood to regain your strength while hiding from the scorching sun to survive. Rebuild your castle and convert humans into your loyal servants in a quest to raise your vampire empire. Make allies or enemies online or play solo locally, fend off holy soldiers, and wage war in a world of conflict.
    
    Will you become the next Dracula?
    A Gothic Open-World
    Explore a vast world teeming with mythical horrors and danger. Travel through lush forests, open countryside, and dark caverns to discover valuable resources, meeting friends and foes alike along the way. Traverse the world with vampire comrades or hunt solo as you pillage villages, raid bandits, and delve into the domains of supernatural beasts.",
  )

  vrising.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainvrising.jpeg"),
                            filename: "mainvrising.jpeg")

  vrising.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1vrising.jpg"),
                             filename: "gameimage1vrising.jpg")

  vrising.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2vrising.jpg"),
                             filename: "gameimage2vrising.jpg")

  vrising.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3vrising.jpg"),
                             filename: "gameimage3vrising.jpg")

  vrising.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4vrising.jpg"),
                             filename: "gameimage4vrising.jpg")

  huntshowdown = Game.create!(
    name: "Hunt: Showdown",
    price: 39.99,
    genre: "Atmospheric",
    category: "Open World",
    developer: "Crytek",
    publisher: "Crytek",
    release_date: "Aug 27, 2019",
    detail: "Hunt: Showdown is a high-stakes, tactical PvPvE first-person shooter. Hunt for bounties in the infested Bayou, kill nightmarish monsters and outwit competing hunters - alone or in a group - with your glory, gear, and gold on the line.",
    description: "HUNT TOGETHER. DIE ALONE.

    The year is 1895, and you are a Hunter tasked with eliminating the savage, nightmarish monsters that have infested the Louisiana Bayou. Play alone or in teams of two or three, as you search for clues to help you track your target and compete against other Hunters who are after the same reward. Kill and banish your target, collect the bounty, and then get ready for the showdown; once the bounty is in your hands every other Hunter on the map will be after your prize. Show no mercy as you fight through a dark, ruthless world with brutal, period-inspired weapons, as you level up, unlock gear, and collect experience and gold for your Bloodline.
    
    HIGH-RISK, HIGH-REWARD, HIGH-TENSION GAMEPLAY
    
    Competitive, match-based gameplay combines PvP and PvE elements to create a uniquely tense PvEvP experience where your character and your gear are always on the line. Succeed, and you will be rewarded handsomely but remember – a single mistake could cost you your Hunter – and any gear they were carrying.",
  )

  huntshowdown.main_image.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/mainhuntshowdown.jpeg"),
                                 filename: "mainhuntshowdown.jpeg")

  huntshowdown.game_image1.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage1huntshowdown.jpg"),
                                  filename: "gameimage1huntshowdown.jpg")

  huntshowdown.game_image2.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage2huntshowdown.jpg"),
                                  filename: "gameimage2huntshowdown.jpg")

  huntshowdown.game_image3.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage3huntshowdown.jpg"),
                                  filename: "gameimage3huntshowdown.jpg")

  huntshowdown.game_image4.attach(io: URI.open("https://staream-seeds.s3.amazonaws.com/gameimage4huntshowdown.jpg"),
                                  filename: "gameimage4huntshowdown.jpg")

  #  = Game.create!(
  #   name: ,
  #   price: ,
  #   genre: ,
  #   category: ,
  #   developer: ,
  #   publisher: ,
  #   release_date: ,
  #   detail: ,
  #   description:,
  # )

  # .main_image.attach(io: URI.open(""),
  # filename: "main.jpeg")

  # .game_image1.attach(io: URI.open(""),
  #  filename: "gameimage1.jpg")

  # .game_image2.attach(io: URI.open(""),
  #  filename: "gameimage2.jpg")

  # .game_image3.attach(io: URI.open(""),
  #  filename: "gameimage3.jpg")

  # .game_image4.attach(io: URI.open(""),
  #  filename: "gameimage4.jpg")

  puts "Done!"
end
