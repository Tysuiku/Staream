import React from "react";
import "./GameDetails.css";

const GameDetails = ({ game }) => {
  return (
    <div className="game-details">
      <p>{game.description}</p>
      <p>{`Genre: ${game.genre}`}</p>
    </div>
  );
};

export default GameDetails;
