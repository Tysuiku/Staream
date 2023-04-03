import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import * as sessionActions from "../../store/session";
import "./SignupForm.css";

function SignupFormPage() {
  const dispatch = useDispatch();
  const sessionUser = useSelector((state) => state.session.user);
  const [email, setEmail] = useState("");
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [errors, setErrors] = useState([]);

  if (sessionUser) return <Redirect to="/" />;

  const handleSubmit = (e) => {
    e.preventDefault();

    if (password === confirmPassword) {
      setErrors([]);
      return dispatch(
        sessionActions.signup({ email, username, password })
      ).catch(async (res) => {
        let data;
        try {
          data = await res.clone().json();
        } catch {
          data = await res.text();
        }
        if (data?.errors) setErrors(data.errors);
        else if (data) setErrors([data]);
        else setErrors([res.statusText]);
      });
    }
    return setErrors(["Passwords are not the same"]);
  };

  return (
    <div className="signupPage1Container">
      <div>
        <div className="signup-page-container">
          <div className="signup-header-div">
            {errors.length > 0 && (
              <div className="signUpErrorBox">
                <ul className="signupFormErrors">
                  {errors.map((error) => (
                    <li key={error}>{error}</li>
                  ))}
                </ul>
              </div>
            )}

            <h1 className="signup-header">CREATE YOUR ACCOUNT</h1>
          </div>

          <div>
            <form className="signup-form" onSubmit={handleSubmit}>
              <div className="input-container">
                <label htmlFor="email">Email Address</label>
                <input
                  type="text"
                  id="email"
                  value={email}
                  onChange={(e) => setEmail(e.target.value)}
                  required
                />
              </div>

              <div className="input-container">
                <label htmlFor="username">Username</label>
                <input
                  type="text"
                  id="username"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                  required
                />
              </div>

              <div className="input-container">
                <label htmlFor="password" style={{ marginBottom: "10px" }}>
                  Password
                </label>
                <input
                  type="password"
                  id="password"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                  required
                />
              </div>

              <div className="input-container">
                <label htmlFor="confirmPassword">Confirm Password</label>
                <input
                  type="password"
                  id="confirmPassword"
                  value={confirmPassword}
                  onChange={(e) => setConfirmPassword(e.target.value)}
                  required
                />
              </div>

              <button type="submit" className="signup-button">
                Sign Up
              </button>
            </form>
          </div>
        </div>
      </div>

      <div className="signupBackgroundBody"></div>
    </div>
  );
}

export default SignupFormPage;
