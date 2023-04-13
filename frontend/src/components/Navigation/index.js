import React from "react";
import { NavLink } from "react-router-dom";
import { useSelector } from "react-redux";
import ProfileButton from "./ProfileButton";
import "./Navigation.css";
import stareamLogo from "./stareamLOGO.jpeg";

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
        <NavLink exact to="/" className="appName">
          <div className="stareamTitle">
            <img src={stareamLogo} />
            <p>
              STAREAM<span className="supscript">™</span>
            </p>
          </div>
        </NavLink>
      </div>
      <div className="githubLinkedin-links">
        <a
          href="https://github.com/Tysuiku/Staream"
          target="_blank"
          id="gitHUBB"
        >
          GitHub
        </a>
        <a
          href="https://www.linkedin.com/in/timothy-dong-19a700254/"
          target="_blank"
          id="linkedINN"
        >
          LinkedIn
        </a>
      </div>

      <div className="navlink">{sessionLinks}</div>
    </div>
  );
};

export default Navigation;
