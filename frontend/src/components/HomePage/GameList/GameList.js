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
          <div
            key={game.id}
            className={"game" + (game === hoveredGame ? " hover" : "")}
            onMouseEnter={() => handleGameHover(game)}
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
          </div>
        </div>
      )}
    </div>
  );
};

export default GameList;
