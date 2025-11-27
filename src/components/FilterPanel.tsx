import { X } from 'lucide-react';

interface FilterPanelProps {
  allClasses: string[];
  allDays: string[];
  timeSlots: string[];
  selectedClasses: string[];
  selectedDays: string[];
  selectedTimes: string[];
  onClassChange: (classes: string[]) => void;
  onDayChange: (days: string[]) => void;
  onTimeChange: (times: string[]) => void;
}

export function FilterPanel({
  allClasses,
  allDays,
  timeSlots,
  selectedClasses,
  selectedDays,
  selectedTimes,
  onClassChange,
  onDayChange,
  onTimeChange
}: FilterPanelProps) {
  const toggleClass = (className: string) => {
    if (selectedClasses.includes(className)) {
      onClassChange(selectedClasses.filter(c => c !== className));
    } else {
      onClassChange([...selectedClasses, className]);
    }
  };

  const toggleDay = (day: string) => {
    if (selectedDays.includes(day)) {
      onDayChange(selectedDays.filter(d => d !== day));
    } else {
      onDayChange([...selectedDays, day]);
    }
  };

  const toggleTime = (time: string) => {
    if (selectedTimes.includes(time)) {
      onTimeChange(selectedTimes.filter(t => t !== time));
    } else {
      onTimeChange([...selectedTimes, time]);
    }
  };

  const clearAll = () => {
    onClassChange([]);
    onDayChange([]);
    onTimeChange([]);
  };

  const hasFilters = selectedClasses.length > 0 || selectedDays.length > 0 || selectedTimes.length > 0;

  return (
    <div className="bg-white border-b border-gray-200 shadow-sm">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6">
        <div className="flex justify-between items-center mb-4">
          <h3>Filter Options</h3>
          {hasFilters && (
            <button
              onClick={clearAll}
              className="flex items-center gap-2 text-maroon-600 hover:text-maroon-700 transition-colors"
            >
              <X className="w-4 h-4" />
              Clear All
            </button>
          )}
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {/* Classes Filter */}
          <div>
            <p className="text-gray-700 mb-3">Classes</p>
            <div className="space-y-2 max-h-64 overflow-y-auto">
              {allClasses.map(className => (
                <label
                  key={className}
                  className="flex items-center gap-2 cursor-pointer hover:bg-gray-50 p-2 rounded transition-colors"
                >
                  <input
                    type="checkbox"
                    checked={selectedClasses.includes(className)}
                    onChange={() => toggleClass(className)}
                    className="w-4 h-4 text-maroon-600 border-gray-300 rounded focus:ring-maroon-500"
                  />
                  <span className="text-gray-700">{className}</span>
                </label>
              ))}
            </div>
          </div>

          {/* Days Filter */}
          <div>
            <p className="text-gray-700 mb-3">Days</p>
            <div className="space-y-2">
              {allDays.map(day => (
                <label
                  key={day}
                  className="flex items-center gap-2 cursor-pointer hover:bg-gray-50 p-2 rounded transition-colors"
                >
                  <input
                    type="checkbox"
                    checked={selectedDays.includes(day)}
                    onChange={() => toggleDay(day)}
                    className="w-4 h-4 text-maroon-600 border-gray-300 rounded focus:ring-maroon-500"
                  />
                  <span className="text-gray-700">{day}</span>
                </label>
              ))}
            </div>
          </div>

          {/* Time Slots Filter */}
          <div>
            <p className="text-gray-700 mb-3">Time Slots</p>
            <div className="space-y-2">
              {timeSlots.map(time => (
                <label
                  key={time}
                  className="flex items-center gap-2 cursor-pointer hover:bg-gray-50 p-2 rounded transition-colors"
                >
                  <input
                    type="checkbox"
                    checked={selectedTimes.includes(time)}
                    onChange={() => toggleTime(time)}
                    className="w-4 h-4 text-maroon-600 border-gray-300 rounded focus:ring-maroon-500"
                  />
                  <span className="text-gray-700">{time}</span>
                </label>
              ))}
            </div>
          </div>
        </div>
      </div>

      <style>{`
        .text-maroon-600 {
          color: #500000;
        }
        
        .text-maroon-700 {
          color: #3d0000;
        }
        
        .hover\\:text-maroon-700:hover {
          color: #3d0000;
        }
        
        input[type="checkbox"].text-maroon-600:checked {
          background-color: #500000;
          border-color: #500000;
        }
        
        .focus\\:ring-maroon-500:focus {
          --tw-ring-color: #500000;
        }
      `}</style>
    </div>
  );
}
