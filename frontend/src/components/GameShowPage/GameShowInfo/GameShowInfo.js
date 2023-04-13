import React from "react";
import "./GameShowInfo.css";

const GameShowInfo = ({ game }) => {
  return (
    <>
      <div className="GameShowInfoBox">
        <img src={game.mainImage} alt={game.name} />
        <p>{game.detail}</p>
        <p className="game-info-datval">
          <span className="info-label-date">RELEASE DATE: </span>{" "}
          {game.releaseDate}
        </p>

        <div className="gamesDevPubRe">
          <p className="game-info-value">
            <span className="info-label-dev">DEVELOPER:</span> {game.publisher}
          </p>
          <p className="game-info-value">
            <span className="info-label-pub">PUBLISHER:</span> {game.publisher}
          </p>
        </div>

        <div className="gamesGenreCat">
          <p>{game.genre}</p>
          <p>{game.category}</p>
        </div>
      </div>
    </>
  );
};

export default GameShowInfo;
