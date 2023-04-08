import React from "react";
import "./GameShowInfo.css";

const GameShowInfo = ({ game }) => {
  return (
    <>
      <div className="GameShowInfoBox">
        <img src={game.mainImage} alt={game.name} />
        <p>{game.detail}</p>

        <div className="gamesGenreCat">
          <p>{game.genre}</p>
          <p>{game.category}</p>
        </div>
      </div>
      <div className="gamesShowInfoDes">
        <h1>ABOUT THIS GAME</h1>
        <p>{game.description}</p>
      </div>
    </>
  );
};

export default GameShowInfo;
