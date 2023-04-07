import React, { useState, useEffect } from "react";
import { NavLink } from "react-router-dom";
import "./GameList.css";

const GameList = ({ games }) => {
  const [hoveredGame, setHoveredGame] = useState(games[0]);

  useEffect(() => {
    if (games.length > 0) {
      setHoveredGame(games[0]);
    }
  }, [games]);

  const handleGameHover = (game) => {
    setHoveredGame(game);
  };

  const totalHeight = games.length * 64;

  return (
    <div className="homePageGameList">
      <div className="gameListContainer" style={{ height: `${totalHeight}px` }}>
        {games.map((game) => (
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
