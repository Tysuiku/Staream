import React, { useState } from "react";
import { NavLink } from "react-router-dom";
import "./GameList.css";

const GameList = ({ games }) => {
  const [hoveredGame, setHoveredGame] = useState(null);

  const handleGameHover = (game) => {
    setHoveredGame(game);
  };

  const handleGameLeave = () => {
    setHoveredGame(null);
  };

  const totalHeight = games.reduce((acc, game) => acc + 64, 0); // 64 is the height of each game item

  return (
    <div className="homePageGameList">
      <div className="gameListContainer" style={{ height: `${totalHeight}px` }}>
        {games.map((game) => (
          <div
            key={game.id}
            className={`game ${hoveredGame === game ? "game-hover" : ""}`}
            onMouseEnter={() => handleGameHover(game)}
            onMouseLeave={handleGameLeave}
          >
            <NavLink to={`/games/${game.id}`}>{game.name}</NavLink>
            <span>{game.price ? `$${game.price}` : "Free to Play"}</span>
          </div>
        ))}
        {hoveredGame && (
          <div className="game-details">
            <p>{hoveredGame.description}</p>
            <p>{`Genre: ${hoveredGame.genre}`}</p>
          </div>
        )}
      </div>
    </div>
  );
};

export default GameList;
