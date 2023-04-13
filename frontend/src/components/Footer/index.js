import "./footer.css";
import stareamLogo from "./stareamLOGO.jpeg";

export default function Footer() {
  return (
    <footer className="stareamFooter-wrapper">
      <div className="stareamFooter-sandwich">
        <div className="stareamHoshi-logo">
          Hosh<span>i</span>
        </div>
        <section className="stareamLegal-text-wrapper">
          <p>
            © 2023 Hoshi Corporation. Made by{" "}
            <a href="#">Timothy Dong aka Tysuiku</a>. Staream is a fullstack
            clone of <a href="#">Steam</a>. All trademarks are property of their
            respective owners in the US and other countries. Disclaimer All
            images and content used belongs to Steam/Valve or their original
            owners.
          </p>
        </section>
        <div className="stareamFooter-star-logo">
          <img src={stareamLogo} className="starLogoFoot" />
          <h1>Staream</h1>
        </div>
      </div>
      <div className="stareamFooter-links">
        <span>
          <p className="titleTextFoot">Tech Used</p> |{" "}
          <span className="plainText">React</span> |{" "}
          <span className="plainText">Redux</span> |
          <span className="plainText"> AWS S3</span> |
          <span className="plainText"> Ruby on Rails</span> |
          <span className="plainText"> PostgreSQL</span> |
        </span>
        <span>
          <p className="titleTextFoot">Find Me</p>
          <a
            href="https://www.linkedin.com/in/timothy-dong-19a700254/"
            target="_blank"
          >
            <i className="fa-brands fa-linkedin" />
            LinkedIn |
          </a>{" "}
          <a href="https://github.com/Tysuiku/Staream" target="_blank">
            <i className="fa-brands fa-square-github" />
            Github
          </a>{" "}
        </span>
      </div>
    </footer>
  );
}
