import React from "react";
import { Link } from "react-router-dom";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";
import "./GameCarousel.css";
import SwiperCore, { Autoplay, Navigation, Pagination } from "swiper/core";

SwiperCore.use([Autoplay, Navigation, Pagination]);

export default function GameCarousel({ games }) {
  return (
    <div className="allGameCarouselBox">
      <h1 className="featured">FEATURED & RECOMMENDED</h1>
      <div>
        <Swiper
          spaceBetween={20}
          centeredSlides={true}
          autoplay={{
            delay: 5000,
            disableOnInteraction: false,
          }}
          pagination={{
            clickable: true,
            dynamicBullets: true,
            renderBullet: function (index, className) {
              return `<span class="${className}" style="background-color: hsla(202,60%,100%,0.2)"></span>`;
            },
          }}
          navigation={{
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          }}
          className="mySwiper"
        >
          {games.map((game) => (
            <SwiperSlide key={game.id}>
              <div className="game-slide">
                <Link to={`/game/${game.id}`}>
                  <div className="main-image">
                    <img src={game.mainImage} alt={game.title} />
                  </div>
                </Link>
                <div className="game-images">
                  <div className="game-name-carousel">{game.name}</div>
                  <div>
                    <Link to={`/game/${game.id}`}>
                      <div className="game-image">
                        <img
                          src={game.gameImage1}
                          alt={`${game.title} - Game 1`}
                        />
                      </div>
                    </Link>
                    <Link to={`/game/${game.id}`}>
                      <div className="game-image">
                        <img
                          src={game.gameImage2}
                          alt={`${game.title} - Game 2`}
                        />
                      </div>
                    </Link>
                  </div>
                  <div>
                    <Link to={`/game/${game.id}`}>
                      <div className="game-image">
                        <img
                          src={game.gameImage3}
                          alt={`${game.title} - Game 3`}
                        />
                      </div>
                    </Link>
                    <Link to={`/game/${game.id}`}>
                      <div className="game-image">
                        <img
                          src={game.gameImage4}
                          alt={`${game.title} - Game 4`}
                        />
                      </div>
                    </Link>
                  </div>
                </div>
              </div>
            </SwiperSlide>
          ))}
          <div
            className="swiper-button-prev"
            style={{
              background:
                "linear-gradient(to right, rgba( 0, 0, 0, 0) 5%, rgba( 0, 0, 0, 0.3) 95%)",
            }}
          ></div>
          <div
            className="swiper-button-next"
            style={{
              background:
                "linear-gradient(to right, rgba( 0, 0, 0, 0) 5%, rgba( 0, 0, 0, 0.3) 95%)",
            }}
          ></div>
        </Swiper>
      </div>
    </div>
  );
}
