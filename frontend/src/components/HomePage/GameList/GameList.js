import { Link } from "react-router-dom";
import "./GameListItem.css";

export default function GameListItem({ game = {} }) {
  return (
    <Link to={`/games/${game.id}`} className="game-list-item">
      <h1>{game.name}</h1>
      <p>{game.price > 0 ? "$" + game.price : "Free to Play"}</p>
    </Link>
  );
}
