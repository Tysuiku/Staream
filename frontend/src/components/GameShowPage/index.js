import React, { useEffect, useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { useParams } from "react-router-dom";
import GameShowCarousel from "./GameShowCarousel/GameShowCarousel";
import GameShowInfo from "./GameShowInfo/GameShowInfo";
import AddToCartButton from "./AddToCartButton";
import { fetchGame } from "../../store/games";
import { fetchGames } from "../../store/games";
import "./ShowPage.css";
import GameNavbar from "../HomePage/GameNavbar/GameNavbar";
import { NavLink } from "react-router-dom";
import Footer from "../Footer";
import ReviewList from "./reviews/ReviewList";
import ReviewForm from "./reviews/ReviewForm";

const GameShowPage = () => {
  const { id } = useParams();
  const game = useSelector((state) => state.games[id]) || {};
  const user = useSelector((state) => state.session.user);
  const dispatch = useDispatch();

  const [isGameLoading, setIsGameLoading] = useState(true);
  const [isReviewsLoading, setIsReviewsLoading] = useState(true);

  useEffect(() => {
    dispatch(fetchGame(id)).then(() => {
      setIsGameLoading(false);
      setIsReviewsLoading(false);
    });
  }, [dispatch, id]);

  const games2 = useSelector((state) => {
    return Object.values(state.games);
  });

  useEffect(() => {
    dispatch(fetchGames());
  }, [dispatch]);

  const userOwnsGame = () => {
    if (!user || !user.purchasedGames) {
      console.log("User or purchasedGames is not available:", user);
      return false;
    }

    const userOwns = user.purchasedGames.some(
      (purchasedGame) => purchasedGame.gameId === parseInt(id)
    );

    console.log("User:", user);
    console.log("Purchased Games:", user.purchasedGames);
    console.log("Game ID:", parseInt(id));
    console.log("User Owns Game:", userOwns);

    return userOwns;
  };

  if (isGameLoading) {
    return <div>Loading...</div>;
  }

  return (
    <div className="showPageMainBox">
      <div>
        <NavLink to={"/cart"}>
          <p className="showCart">Cart</p>
        </NavLink>
        <div className="allgameshowpageItems">
          <div className="gameNavBarShowPage">
            <GameNavbar games={games2} />
          </div>

          <h1 className="gameNameShowPage">{game.name}</h1>

          <div className="ShowPageComponents">
            <GameShowCarousel key={game.id} game={game} />
            <GameShowInfo game={game} />

            <div className="gameinfobuyBox">
              <AddToCartButton game={game} />{" "}
              <div className="gamesShowInfoDes">
                <h1>ABOUT THIS GAME</h1>
                <p>{game.description}</p>
              </div>
            </div>

            {/* Add the Review components below */}
            {!isReviewsLoading && (
              <div className="game-reviews">
                <ReviewList gameId={game.id} currentUserId={user && user.id} />
                {userOwnsGame() ? (
                  <ReviewForm gameId={game.id} user={user} />
                ) : (
                  <p>Please purchase the game to write a review.</p>
                )}
              </div>
            )}
          </div>
        </div>
      </div>
      <div className="showPageFooter">
        <Footer />
      </div>
    </div>
  );
};

export default GameShowPage;
