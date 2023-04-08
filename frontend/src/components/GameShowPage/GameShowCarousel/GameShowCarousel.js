import React, { useRef, useState, useEffect } from "react";
import { Swiper, SwiperSlide } from "swiper/react";
import "swiper/css";
import "swiper/css/free-mode";
import "swiper/css/navigation";
import "swiper/css/thumbs";
import "./GameShowCarousel.css";
import { FreeMode, Navigation, Thumbs } from "swiper";

export default function GameShowCarousel({ game }) {
  const [thumbsSwiper, setThumbsSwiper] = useState(null);
  const [swiper, setSwiper] = useState(null);
  const prevGame = useRef(null);

  useEffect(() => {
    if (swiper && game !== prevGame.current) {
      swiper.update();
      swiper.thumbs.swiper.update();
      prevGame.current = game;
    }
  }, [swiper, game]);

  if (!game) {
    return null;
  }

  const { gameImage1, gameImage2, gameImage3, gameImage4 } = game;

  return (
    <>
      <div className="gameShowCarouselBox">
        <Swiper
          spaceBetween={10}
          navigation={false}
          thumbs={{ swiper: thumbsSwiper }}
          modules={[FreeMode, Navigation, Thumbs]}
          className="game-show-carousel"
          onSwiper={setSwiper}
        >
          <SwiperSlide>
            <img src={gameImage1} />
          </SwiperSlide>
          <SwiperSlide>
            <img src={gameImage2} />
          </SwiperSlide>
          <SwiperSlide>
            <img src={gameImage3} />
          </SwiperSlide>
          <SwiperSlide>
            <img src={gameImage4} />
          </SwiperSlide>
        </Swiper>
        <Swiper
          onSwiper={setThumbsSwiper}
          spaceBetween={10}
          slidesPerView={4}
          freeMode={true}
          watchSlidesProgress={true}
          modules={[FreeMode, Navigation, Thumbs]}
          className="game-show-carousel-thumbs"
        >
          <SwiperSlide>
            <div className="thumb-container">
              <img src={gameImage1} />
            </div>
          </SwiperSlide>
          <SwiperSlide>
            <div className="thumb-container">
              <img src={gameImage2} />
            </div>
          </SwiperSlide>
          <SwiperSlide>
            <div className="thumb-container">
              <img src={gameImage3} />
            </div>
          </SwiperSlide>
          <SwiperSlide>
            <div className="thumb-container">
              <img src={gameImage4} />
            </div>
          </SwiperSlide>
        </Swiper>
      </div>
    </>
  );
}
