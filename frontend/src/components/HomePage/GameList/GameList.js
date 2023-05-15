import React, { useState, useEffect } from "react";
import { NavLink } from "react-router-dom";
import "./GameList.css";

const GameList = ({ games }) => {
  // Create a new, smaller set of game data
  const [gameData, setGameData] = useState([]);

  useEffect(() => {
    if (games.length > 0) {
      // Only keep the properties we need
      const newGameData = games.map(
        ({
          id,
          mainImage,
          name,
          price,
          gameImage1,
          gameImage2,
          gameImage3,
          gameImage4,
        }) => ({
          id,
          mainImage,
          name,
          price,
          gameImage1,
          gameImage2,
          gameImage3,
          gameImage4,
        })
      );

      setGameData(newGameData);
      setHoveredGame(newGameData[0]);
    }
  }, [games]);

  const [hoveredGame, setHoveredGame] = useState(gameData[0]);

  const handleGameHover = (game) => {
    setHoveredGame(game);
  };

  const totalHeight = gameData.length * 64;

  return (
    <div className="homePageGameList">
      <div className="gameListContainer" style={{ height: `${totalHeight}px` }}>
        {gameData.map((game) => (
          <NavLink
            key={game.id}
            to={`/games/${game.id}`}
            className={"game" + (game === hoveredGame ? " hover" : "")}
            onMouseEnter={() => handleGameHover(game)}
          >
            <div className="game-info">
              <span className="game-mainImg">
                <img src={game.mainImage} alt="game-main-image"></img>
              </span>
              <span className="game-name">{game.name}</span>
              <span className="game-price">
                {game.price ? `$${game.price}` : "Free to Play"}
              </span>
            </div>
          </NavLink>
        ))}
      </div>
      {hoveredGame && (
        <div className="game-details-wrapper">
          <div className="game-details">
            <h2>{hoveredGame.name}</h2>
            <img src={hoveredGame.gameImage1} alt="game screenshot" />
            <img src={hoveredGame.gameImage2} alt="game screenshot" />
            <img src={hoveredGame.gameImage3} alt="game screenshot" />
            <img src={hoveredGame.gameImage4} alt="game screenshot" />
          </div>
        </div>
      )}
    </div>
  );
};

export default GameList;
