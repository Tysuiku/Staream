import React, { useState } from "react";
import * as sessionActions from "../../store/session";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import "./LoginForm.css";
import Footer from "../Footer";

function LoginFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const [credential, setCredential] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({ credential, password })).catch(
      async (res) => {
        const data = await res.json().catch(() => res.text());
        if (data?.errors) {
          setErrors(data.errors);
        } else {
          setErrors([data || res.statusText]);
        }
      }
    );
  };

  const handleDemoClick = (e) => {
    e.preventDefault();
    loginDemoUser();
  };

  const loginDemoUser = () => {
    const demoUser = { credential: "Demo-User", password: "password" };
    dispatch(sessionActions.login(demoUser));
  };

  return (
    <div className="loginPage1Container">
      <div>
        <div className="login-page">
          <div className="login-header-div">
            <h1 className="login-header">SIGN IN</h1>
          </div>

          <div className="login-form">
            <form onSubmit={handleSubmit}>
              <div className="input-container">
                <label htmlFor="credential">SIGN IN WITH ACCOUNT NAME</label>
                <input
                  type="text"
                  id="credential"
                  value={credential}
                  onChange={(e) => setCredential(e.target.value)}
                  required
                />
              </div>

              <div className="input-container">
                <label htmlFor="password">PASSWORD</label>
                <input
                  type="password"
                  id="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>

              <div className="Demo-Login-Regular-Login">
                <button onClick={handleDemoClick} className="demo-login-button">
                  Demo-Login
                </button>
                <button type="submit" className="login-button">
                  Sign in
                </button>
              </div>

              <ul className="loginFormErrors">
                {errors.map((error, index) => (
                  <li key={index}>{error}</li>
                ))}
              </ul>
            </form>
          </div>
        </div>
      </div>

      <div>
        <Footer />
      </div>
    </div>
  );
}

export default LoginFormPage;
