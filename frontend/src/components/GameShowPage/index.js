import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useParams } from "react-router-dom";
import GameShowCarousel from "./GameShowCarousel/GameShowCarousel";
import GameShowInfo from "./GameShowInfo/GameShowInfo"; // import the component
import { fetchGame } from "../../store/games";
import "./ShowPage.css";

const GameShowPage = () => {
  const { id } = useParams();
  const game = useSelector((state) => state.games[id]) || {};
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchGame(id));
  }, [dispatch, id]);

  return (
    <div>
      <h1 className="gameNameShowPage">{game.name}</h1>

      <div className="ShowPageComponents">
        <GameShowCarousel key={game.id} game={game} />
        <GameShowInfo game={game} />
      </div>
    </div>
  );
};

export default GameShowPage;
