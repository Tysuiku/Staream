import React, { useState, useEffect } from "react";
import { NavLink } from "react-router-dom";
import "./GameList.css";

const GameList = ({ games }) => {
  const [hoveredGame, setHoveredGame] = useState(null);

  useEffect(() => {
    if (games.length > 0) {
      setHoveredGame(games[0]);
    }
  }, [games]);

  const handleGameHover = (game) => {
    setHoveredGame(game);
  };

  const handleGameLeave = () => {};

  const totalHeight = games.reduce((acc, game) => acc + 64, 0);

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
      </div>
      {hoveredGame && (
        <div className="game-details-wrapper">
          <div className="game-details">
            <h2>{hoveredGame.name}</h2>
            <p>{hoveredGame.description}</p>
            <p>{`Genre: ${hoveredGame.genre}`}</p>
            <NavLink to={`/games/${hoveredGame.id}`}>View details</NavLink>
          </div>
        </div>
      )}
    </div>
  );
};

export default GameList;
