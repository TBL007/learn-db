"use client";

import { useEffect, useRef, useState } from "react";

interface StepImageProps {
  src?: string;
  alt: string;
}

export default function StepImage({ src, alt }: StepImageProps) {
  const [failed, setFailed] = useState(false);
  const imageRef = useRef<HTMLImageElement>(null);

  useEffect(() => {
    const image = imageRef.current;
    if (image?.complete && image.naturalWidth === 0) {
      setFailed(true);
    }
  }, []);

  if (!src || failed) {
    return (
      <div className="step-image">
        <div
          className="step-image-placeholder"
          role="img"
          aria-label={`${alt} (image unavailable)`}
        >
          <svg
            viewBox="0 0 100 100"
            preserveAspectRatio="none"
            aria-hidden="true"
          >
            <path
              d="M0 0 L100 100 M100 0 L0 100"
              stroke="#d0d0d0"
              strokeWidth="1"
              vectorEffect="non-scaling-stroke"
            />
          </svg>
        </div>
      </div>
    );
  }

  return (
    <div className="step-image">
      {/* eslint-disable-next-line @next/next/no-img-element */}
      <img ref={imageRef} src={src} alt={alt} onError={() => setFailed(true)} />
    </div>
  );
}
