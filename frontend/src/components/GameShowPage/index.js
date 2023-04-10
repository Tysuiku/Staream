import React, { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useParams } from "react-router-dom";
import GameShowCarousel from "./GameShowCarousel/GameShowCarousel";
import GameShowInfo from "./GameShowInfo/GameShowInfo"; // import the component
import { fetchGame } from "../../store/games";
import { fetchGames } from "../../store/games";
import "./ShowPage.css";
import GameNavbar from "../HomePage/GameNavbar/GameNavbar";

const GameShowPage = () => {
  const { id } = useParams();
  const game = useSelector((state) => state.games[id]) || {};
  const dispatch = useDispatch();

  useEffect(() => {
    dispatch(fetchGame(id));
  }, [dispatch, id]);

  const games2 = useSelector((state) => {
    return Object.values(state.games);
  });

  useEffect(() => {
    dispatch(fetchGames());
  }, [dispatch]);

  return (
    <div>
      <div className="gameNavBarShowPage">
        <GameNavbar games={games2} />
      </div>

      <h1 className="gameNameShowPage">{game.name}</h1>

      <div className="ShowPageComponents">
        <GameShowCarousel key={game.id} game={game} />
        <GameShowInfo game={game} />
      </div>
    </div>
  );
};

export default GameShowPage;
