import { useState } from "react";
import { NavLink } from "react-router-dom";
import badapple from "./touhou badapple.jpeg";
import "./GameNavbar.css";

export default function GameNavbar({ games }) {
  const [value, setValue] = useState("");

  const onChange = (event) => {
    setValue(event.target.value);
  };

  return (
    <div className="GameNavbarBox">
      <NavLink exact to="/">
        <div className="yourStore">
          {/* <img src={badapple} className="yourStoreProfile" /> */}
          <p>Your Store</p>
        </div>
      </NavLink>
      <div className="GameSearch">
        <div className="search-container">
          <div className="search-inner">
            <input
              type="text"
              placeholder="Search"
              value={value}
              onChange={onChange}
            />
          </div>
          <div className="dropdown">
            {games
              .filter((game) => {
                if (!game || !game.name) return false;

                const searchTerm = value.toLowerCase();
                const gameName = game.name.toLowerCase();

                return (
                  searchTerm &&
                  gameName.startsWith(searchTerm) &&
                  gameName !== searchTerm
                );
              })
              .slice(0, 5)
              .map((game) => (
                <NavLink
                  to={`/games/${game.id}`}
                  className="dropdown-row"
                  key={game.id}
                  onClick={() => setValue(game.name)}
                >
                  <img src={game.mainImage} alt={game.name} />
                  {game.name}
                </NavLink>
              ))}
          </div>
        </div>
      </div>
    </div>
  );
}
