import React from "react";
import { NavLink } from "react-router-dom";
import { useSelector } from "react-redux";
import ProfileButton from "./ProfileButton";
import "./Navigation.css";

const Navigation = () => {
  const sessionUser = useSelector((state) => state.session.user);
  let sessionLinks;

  if (sessionUser) {
    sessionLinks = <ProfileButton id="profile" user={sessionUser} />;
  } else {
    sessionLinks = (
      <>
        <NavLink to="/login" className={"loginSignupLink"}>
          login
        </NavLink>
        <p className="loginSignupDivder">|</p>
        <NavLink to="/signup" className={"loginSignupLink"}>
          signup
        </NavLink>
      </>
    );
  }

  return (
    <div className="header">
      <div className="headerLinks">
        <h1 className="appName">
          <p>
            STAREAM<span class="supscript">™</span>
          </p>
        </h1>
      </div>
      <div className="navlink">{sessionLinks}</div>
    </div>
  );
};

export default Navigation;
