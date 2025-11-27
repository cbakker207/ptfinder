import { useState, useEffect, useMemo } from "react";
import { Search, Calendar, Clock, BookOpen, ChevronDown } from "lucide-react";
import { PTCard } from "./components/PTCard";
import tamuLogo from "figma:asset/c0fa8cbbb98e041900c881cda298f7dc027c1f59.png";

export interface PT {
  pt_id: number;
  name: string;
  email: string;
  picture_url: string;
  classes: string[];
  officeHours: {
    day: string;
    time: string; // "10:00 - 12:00" or "10:00:00 - 12:00:00"
    location: string;
  }[];
}

export default function App() {
  const [pts, setPts] = useState<PT[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedDay, setSelectedDay] = useState("All Days");
  const [startTime, setStartTime] = useState("");
  const [endTime, setEndTime] = useState("");

  const allDays = ["All Days", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];

  useEffect(() => {
    const loadPTs = async () => {
      try {
        const res = await fetch("http://localhost:5001/pts");
        const data = await res.json();
        setPts(data);
      } catch (err) {
        console.error("Failed to load PTs:", err);
      }
    };
    loadPTs();
  }, []);

  // -------------------------------------------------------------
  // Generate times: Every 30 minutes 9 AM → 10 PM
  // -------------------------------------------------------------
  const generateTimeOptions = () => {
    const times: string[] = [];

    for (let hour = 9; hour <= 22; hour++) {
      for (let minute = 0; minute < 60; minute += 30) {
        if (hour === 22 && minute > 0) break;

        const val = `${hour.toString().padStart(2, "0")}:${minute === 0 ? "00" : minute}`;
        const dispHour = hour > 12 ? hour - 12 : hour;
        const disp = `${dispHour}:${minute === 0 ? "00" : minute} ${hour >= 12 ? "PM" : "AM"}`;

        times.push(`${val}|${disp}`);
      }
    }

    return times;
  };

  const timeOptions = generateTimeOptions();

  // -------------------------------------------------------------
  // FIXED TIME PARSER — supports:
  // HH:MM, HH:MM:SS, 12-hour AM/PM
  // -------------------------------------------------------------
  const parseToMinutes = (timeStr: string): number => {
    if (!timeStr) return -1;

    // Strip seconds if present
    if (timeStr.length >= 8 && timeStr[5] === ":") {
      timeStr = timeStr.slice(0, 5);
    }

    // 24-hour format HH:MM
    if (/^\d{2}:\d{2}$/.test(timeStr)) {
      const [h, m] = timeStr.split(":").map(Number);
      return h * 60 + m;
    }

    // 12-hour with AM/PM
    const match12 = timeStr.match(/(\d{1,2}):(\d{2})\s*(AM|PM)/i);
    if (match12) {
      let hour = Number(match12[1]);
      const minute = Number(match12[2]);
      const period = match12[3].toUpperCase();

      if (period === "PM" && hour !== 12) hour += 12;
      if (period === "AM" && hour === 12) hour = 0;

      return hour * 60 + minute;
    }

    console.error("Unrecognized time format:", timeStr);
    return -1;
  };

  // -------------------------------------------------------------
  // FIXED OVERLAP CHECK
  // -------------------------------------------------------------
  const timeRangesOverlap = (range: string, start: string, end: string): boolean => {
    if (!start || !end) return true;

    const [sStr, eStr] = range.split(" - ");

    const ohStart = parseToMinutes(sStr.trim());
    const ohEnd = parseToMinutes(eStr.trim());
    const userStart = parseToMinutes(start);
    const userEnd = parseToMinutes(end);

    if (ohStart < 0 || ohEnd < 0 || userStart < 0 || userEnd < 0) {
      return false;
    }

    return ohStart < userEnd && ohEnd > userStart;
  };

  // -------------------------------------------------------------
  // FINAL FILTER LOGIC — FULLY FIXED
  // -------------------------------------------------------------
  const filteredPTs = useMemo(() => {
    return pts.filter((pt) => {
      const matchesSearch =
        searchQuery === "" ||
        pt.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        pt.classes.some((c) => c.toLowerCase().includes(searchQuery.toLowerCase()));

      const matchesDay =
        selectedDay === "All Days" ||
        pt.officeHours.some(
          (oh) => oh.day.trim().toLowerCase() === selectedDay.trim().toLowerCase()
        );

      const matchesTime =
        !startTime ||
        !endTime ||
        pt.officeHours.some((oh) =>
          timeRangesOverlap(oh.time, startTime, endTime)
        );

      return matchesSearch && matchesDay && matchesTime;
    });
  }, [pts, searchQuery, selectedDay, startTime, endTime]);

  return (
    <div className="min-h-screen bg-gray-50">
      {/* HEADER */}
      <header className="bg-maroon-header text-white py-6">
        <div className="max-w-7xl mx-auto px-4">
          <div className="flex items-start gap-4">
            <img src={tamuLogo} className="h-24 object-contain" />
            <div>
              <div className="text-xs uppercase">Texas A&M University</div>
              <div className="text-sm mb-1">Department of Computer Science & Engineering</div>
              <h1 className="text-2xl font-bold">Peer Teachers</h1>
            </div>
          </div>
        </div>
      </header>

      {/* FILTER BAR */}
      <div className="bg-white border-b shadow-sm">
        <div className="max-w-7xl mx-auto px-4 py-6 flex flex-col md:flex-row gap-4">

          {/* SEARCH */}
          <div className="flex-1 relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input
              type="text"
              placeholder="Search by name or class..."
              className="w-full pl-10 pr-3 py-2.5 border border-gray-300 rounded-md"
              onChange={(e) => setSearchQuery(e.target.value)}
            />
          </div>

          {/* DAY FILTER */}
          <div className="relative">
            <Calendar className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <select
              className="appearance-none pl-10 pr-10 py-2.5 border rounded-md bg-white"
              value={selectedDay}
              onChange={(e) => setSelectedDay(e.target.value)}
            >
              {allDays.map((d) => (
                <option key={d}>{d}</option>
              ))}
            </select>
            <ChevronDown className="absolute right-3 top-1/2 -translate-y-1/2 text-gray-500" />
          </div>

          {/* TIME FILTERS */}
          <div className="flex gap-3 items-center">
            <select
              className="px-3 py-2.5 border rounded-md"
              onChange={(e) => setStartTime(e.target.value)}
            >
              <option value="">Start</option>
              {timeOptions.map((t) => {
                const [value, label] = t.split("|");
                return (
                  <option key={value} value={value}>
                    {label}
                  </option>
                );
              })}
            </select>

            <span>to</span>

            <select
              className="px-3 py-2.5 border rounded-md"
              onChange={(e) => setEndTime(e.target.value)}
            >
              <option value="">End</option>
              {timeOptions.map((t) => {
                const [value, label] = t.split("|");
                return (
                  <option key={value} value={value}>
                    {label}
                  </option>
                );
              })}
            </select>
          </div>
        </div>
      </div>

      {/* RESULTS COUNT */}
      <div className="max-w-7xl mx-auto px-4 py-6 flex items-center gap-2 text-gray-700">
        <BookOpen className="w-5 h-5" />
        <span>{filteredPTs.length} peer teachers found</span>
      </div>

      {/* MAIN GRID */}
      <main className="max-w-7xl mx-auto px-4 pb-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredPTs.map((pt) => (
            <PTCard key={pt.pt_id} pt={pt} />
          ))}
        </div>
      </main>

      <style>{`
        .bg-maroon-header {
          background: #500000;
        }
      `}</style>
    </div>
  );
}
