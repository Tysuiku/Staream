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

  const gameImages = [
    game.gameImage1,
    game.gameImage2,
    game.gameImage3,
    game.gameImage4,
  ];

  const renderSlides = (images, isThumb = false) => {
    return images.map((image, index) => (
      <SwiperSlide key={index}>
        {isThumb ? (
          <div className="thumb-container">
            <img src={image} />
          </div>
        ) : (
          <img src={image} className="main-carousel-img" />
        )}
      </SwiperSlide>
    ));
  };

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
          {renderSlides(gameImages)}
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
          {renderSlides(gameImages, true)}
        </Swiper>
      </div>
    </>
  );
}
