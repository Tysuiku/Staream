import React, { useState, useEffect } from "react";
import { useDispatch } from "react-redux";
import * as sessionActions from "../../store/session";

const ProfileButton = ({ user }) => {
  const dispatch = useDispatch();
  const [showMenu, setShowMenu] = useState(false);

  const openMenu = (event) => {
    event.stopPropagation(); // prevent the dropdown from closing when clicked
    setShowMenu(true);
  };

  const closeMenu = () => {
    setShowMenu(false);
  };

  useEffect(() => {
    document.addEventListener("click", closeMenu);

    return () => {
      document.removeEventListener("click", closeMenu);
    };
  }, []);

  const logout = (event) => {
    event.preventDefault();
    dispatch(sessionActions.logout());
  };

  return (
    <div className="profile-button">
      <div>
        <button id="profilebutton" onClick={openMenu}>
          {`${user.username} ▾`}
        </button>
      </div>

      <div className="profileDropDownBox">
        {showMenu && (
          <ul
            className="profile-dropdown"
            onClick={(event) => event.stopPropagation()}
          >
            <li>
              <button
                id="profileLogoutButton"
                onClick={logout}
                className="logOutButton"
              >
                Logout: <span className="username">{user.username}</span>
              </button>
            </li>
          </ul>
        )}
      </div>
    </div>
  );
};

export default ProfileButton;
