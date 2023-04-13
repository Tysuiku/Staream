import React, { useState } from "react";
import * as sessionActions from "../../store/session";
import { useDispatch, useSelector } from "react-redux";
// import { Link } from "react-router-dom/cjs/react-router-dom.min";
import { Redirect } from "react-router-dom";
import "./LoginForm.css";
import Footer from "../Footer";

function LoginFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const [credential, setCredential] = useState("");
  const [password, setPassword] = useState("");
  const [errors, setErrors] = useState([]);
  const [demoClicked, setDemoClicked] = useState(false);

  // Assuming you have an array of error messages called `errors` and
  // the input boxes are identified by their `id` attributes

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();
    setErrors([]);
    return dispatch(sessionActions.login({ credential, password })).catch(
      async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        // console.log(data);
        if (data?.errors) {
          setErrors(data.errors);
        } else if (data) {
          setErrors([data]);
        } else {
          setErrors([res.statusText]);
        }
      }
    );
  };

  const handleDemoClick = (e) => {
    e.preventDefault();
    if (demoClicked) return;
    setDemoClicked(true);
    setCredential("");
    setPassword("");
    setTimeout(loginDemoUser, 100);
  };

  let inputCredential = "Demo-User";
  let inputPassword = "password";

  const loginDemoUser = () => {
    const demoUser = { credential: inputCredential, password: inputPassword };
    return dispatch(sessionActions.login(demoUser));
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

              <button onClick={handleDemoClick} className="demo-login-button">
                Demo-Login
              </button>
              <button type="submit" className="login-button">
                Sign in
              </button>

              <ul className="loginFormErrors">
                {errors.map((error) => (
                  <li key={error}>{error}</li>
                ))}
              </ul>
            </form>
          </div>
        </div>
      </div>

      <div>
        {" "}
        <Footer />
      </div>
    </div>
  );
}

export default LoginFormPage;
