import { Clock, MapPin, Mail, BookOpen } from 'lucide-react';
import type { PT } from '../App';

interface PTCardProps {
  pt: PT;
}

export function PTCard({ pt }: PTCardProps) {
  return (
    <div className="bg-white rounded-lg border border-gray-200 p-5 hover:shadow-md transition-shadow">
      {/* Header with Photo + Name */}
      <div className="flex items-start gap-3 mb-4">
        <img
          src={pt.picture_url}
          alt={pt.name}
          className="w-12 h-12 rounded-full object-cover"
        />

        <div>
          <h3 className="text-gray-900 font-semibold">{pt.name}</h3>
          <a
            href={`mailto:${pt.email}`}
            className="flex items-center gap-1 text-blue-600 hover:text-blue-700"
          >
            <Mail className="w-4 h-4" />
            {pt.email}
          </a>
        </div>
      </div>

      {/* Classes */}
      <div className="mb-4">
        <div className="flex items-center gap-2 mb-2">
          <BookOpen className="w-4 h-4 text-gray-600" />
          <span className="text-gray-700">Classes</span>
        </div>
        <div className="flex flex-wrap gap-2">
          {pt.classes.map((className) => (
            <span
              key={className}
              className="px-2 py-1 bg-gray-100 rounded text-sm border border-gray-200"
            >
              {className}
            </span>
          ))}
        </div>
      </div>

      {/* Office Hours */}
      <div>
        <div className="flex items-center gap-2 mb-2">
          <Clock className="w-4 h-4 text-gray-600" />
          <span className="text-gray-700">Office Hours</span>
        </div>

        <div className="space-y-2">
          {pt.officeHours.map((oh, index) => (
            <div key={index} className="text-sm">
              <div className="text-gray-900 font-medium">
                {oh.day}: {oh.time}
              </div>
              <div className="flex items-center gap-1 text-gray-600">
                <MapPin className="w-3 h-3" />
                {oh.location}
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
