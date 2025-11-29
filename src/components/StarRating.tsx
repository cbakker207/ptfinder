import { useState } from "react";

interface StarProps {
  value: number;
  onSelect: (value: number) => void;
  disabled?: boolean;
}

export function StarRating({ value, onSelect, disabled }: StarProps) {
  const [hovered, setHovered] = useState(0);

  return (
    <div className="flex gap-1 cursor-pointer">
      {[1, 2, 3, 4, 5].map((star) => {
        const active = star <= (hovered || value);

        return (
          <span
            key={star}
            onMouseEnter={() => !disabled && setHovered(star)}
            onMouseLeave={() => !disabled && setHovered(0)}
            onClick={() => !disabled && onSelect(star)}
            className={`text-2xl transition-all duration-200 ${
              active ? "text-yellow-400 scale-110" : "text-gray-300"
            }`}
            style={{ userSelect: "none" }}
          >
            ★
          </span>
        );
      })}
    </div>
  );
}
