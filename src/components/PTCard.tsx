import { useEffect, useState } from "react";
import { Clock, MapPin, Mail, BookOpen } from "lucide-react";
import { StarRating } from "./StarRating";
import type { PT } from "../App";

interface PTCardProps {
  pt: PT;
  userId: number | null;
}

export function PTCard({ pt, userId }: PTCardProps) {
  const [hasRated, setHasRated] = useState(false);

  useEffect(() => {
    if (!userId) return;

    fetch(`http://localhost:5001/user-rating?userId=${userId}&ptId=${pt.pt_id}`)
      .then((res) => res.json())
      .then((data) => setHasRated(data.hasRated));
  }, [userId, pt.pt_id]);

  const handleRating = async (value: number) => {
    if (!userId) {
      alert("Please login first!");
      return;
    }

    if (hasRated) {
      alert("You already rated this PT.");
      return;
    }

    await fetch("http://localhost:5001/rate", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        userId,
        ptId: pt.pt_id,
        rating: value,
      }),
    });

    alert("Rating submitted!");
    setHasRated(true);
    window.location.reload();
  };

  return (
    <div className="bg-white rounded-lg border border-gray-200 p-5 hover:shadow-md transition-shadow">

      <div className="flex items-start gap-3 mb-4">
        <img
          src={pt.picture_url}
          alt={pt.name}
          className="w-12 h-12 rounded-full object-cover"
        />

        <div>
          <h3 className="text-gray-900 font-semibold">{pt.name}</h3>
          <a className="flex items-center gap-1 text-blue-600 hover:text-blue-700"
            href={`mailto:${pt.email}`}>
            <Mail className="w-4 h-4" /> {pt.email}
          </a>
        </div>
      </div>

      <div className="mb-3">
        <div className="text-gray-800 font-medium">
          Rating: {pt.rating.toFixed(1)} ⭐ ({pt.numRatings})
        </div>

        <StarRating value={0} onSelect={handleRating} disabled={hasRated} />

        {hasRated && (
          <div className="text-sm text-green-600 mt-1">
            You already rated this PT.
          </div>
        )}
      </div>

      <div className="mb-4">
        <div className="flex items-center gap-2 mb-2">
          <BookOpen className="w-4 h-4 text-gray-600" />
          <span className="text-gray-700">Classes</span>
        </div>
        <div className="flex flex-wrap gap-2">
          {pt.classes.map((c) => (
            <span key={c} className="px-2 py-1 bg-gray-100 rounded text-sm border">
              {c}
            </span>
          ))}
        </div>
      </div>

      <div>
        <div className="flex items-center gap-2 mb-2">
          <Clock className="w-4 h-4 text-gray-600" />
          <span className="text-gray-700">Office Hours</span>
        </div>

        <div className="space-y-2">
          {pt.officeHours.map((oh, index) => (
            <div key={index}>
              <div className="text-gray-900 font-medium">{oh.day}: {oh.time}</div>
              <div className="flex items-center gap-1 text-gray-600">
                <MapPin className="w-3 h-3" /> {oh.location}
              </div>
            </div>
          ))}
        </div>
      </div>

    </div>
  );
}
