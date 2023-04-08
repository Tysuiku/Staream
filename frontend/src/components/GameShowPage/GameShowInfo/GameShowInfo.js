import React from "react";
import "./GameShowInfo.css";

const GameShowInfo = ({ game }) => {
  return (
    <>
      <div className="GameShowInfoBox">
        <img src={game.mainImage} alt={game.name} />
        <p>{game.detail}</p>
        <p class="game-info-datval">
          <span className="info-label-date">RELEASE DATE: </span>{" "}
          {game.releaseDate}
        </p>

        <div className="gamesDevPubRe">
          <p class="game-info-value">
            <span className="info-label-dev">DEVELOPER:</span> {game.publisher}
          </p>
          <p class="game-info-value">
            <span className="info-label-pub">PUBLISHER:</span> {game.publisher}
          </p>
        </div>

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
