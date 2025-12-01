import { useState, useEffect, useMemo } from "react";
import { Search, Calendar, BookOpen, ChevronDown } from "lucide-react";
import { PTCard } from "./components/PTCard";
import tamuLogo from "figma:asset/c0fa8cbbb98e041900c881cda298f7dc027c1f59.png";

export interface PT {
  pt_id: number;
  name: string;
  email: string;
  picture_url: string;
  rating: number;
  numRatings: number;
  classes: string[];
  officeHours: {
    day: string;
    time: string;
    location: string;
  }[];
}

export default function App() {
  const [pts, setPts] = useState<PT[]>([]);
  const [searchQuery, setSearchQuery] = useState("");
  const [selectedDay, setSelectedDay] = useState("All Days");
  const [startTime, setStartTime] = useState("");
  const [endTime, setEndTime] = useState("");

  const [userId, setUserId] = useState<number | null>(
    Number(localStorage.getItem("userId")) || null
  );
  const [userEmail, setUserEmail] = useState<string | null>(
    localStorage.getItem("userEmail") || null
  );

  const allDays = ["All Days", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];

  // LOGIN
  const login = async () => {
    const email = prompt("Enter your email:");
    if (!email) return;

    // Regex: must be a valid email
    const validEmailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!validEmailRegex.test(email)) {
      alert("Please enter a valid email address.");
      return;
    }

    // OPTIONAL: Only allow TAMU emails
    if (!email.endsWith("@tamu.edu")) {
      alert("Only TAMU emails are allowed.");
      return;
    }

    const res = await fetch("http://localhost:5001/login", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({ email }),
    });

    const data = await res.json();
    setUserId(data.user_id);
    setUserEmail(email);

    localStorage.setItem("userId", String(data.user_id));
    localStorage.setItem("userEmail", email);

    alert("Login successful!");
  };


  const logout = () => {
    setUserId(null);
    setUserEmail(null);
    localStorage.removeItem("userId");
    localStorage.removeItem("userEmail");

    // Force UI refresh (OPTIONAL but recommended)
    window.location.reload();
  };

  // LOAD PTs
  useEffect(() => {
    fetch("http://localhost:5001/pts")
      .then((res) => res.json())
      .then((data) => setPts(data));
  }, []);

  // Generate times (9 AM → 10 PM)
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

  // TIME PARSER
  const parseToMinutes = (timeStr: string): number => {
    if (!timeStr) return -1;

    if (timeStr.length >= 8 && timeStr[5] === ":") {
      timeStr = timeStr.slice(0, 5);
    }

    if (/^\d{2}:\d{2}$/.test(timeStr)) {
      const [h, m] = timeStr.split(":").map(Number);
      return h * 60 + m;
    }

    const match12 = timeStr.match(/(\d{1,2}):(\d{2})\s*(AM|PM)/i);
    if (match12) {
      let hour = Number(match12[1]);
      const minute = Number(match12[2]);
      const period = match12[3].toUpperCase();

      if (period === "PM" && hour !== 12) hour += 12;
      if (period === "AM" && hour === 12) hour = 0;

      return hour * 60 + minute;
    }

    return -1;
  };

  // OVERLAP CHECK
  const timeRangesOverlap = (range: string, start: string, end: string): boolean => {
    if (!start || !end) return true;

    const [sStr, eStr] = range.split(" - ");
    const ohStart = parseToMinutes(sStr.trim());
    const ohEnd = parseToMinutes(eStr.trim());
    const userStart = parseToMinutes(start);
    const userEnd = parseToMinutes(end);

    return ohStart < userEnd && ohEnd > userStart;
  };

  // FILTER
  const filteredPTs = useMemo(() => {
    return pts.filter((pt) => {
      const matchesSearch =
        searchQuery === "" ||
        pt.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        pt.classes.some((c) =>
          c.toLowerCase().includes(searchQuery.toLowerCase())
        );

      // NEW: Combined day + time logic inside the SAME office hour
      const matchesDayAndTime = pt.officeHours.some((oh) => {
        const dayMatches =
          selectedDay === "All Days" ||
          oh.day.trim().toLowerCase() === selectedDay.trim().toLowerCase();

        const timeMatches =
          !startTime ||
          !endTime ||
          timeRangesOverlap(oh.time, startTime, endTime);

        return dayMatches && timeMatches; // BOTH must match here
      });

      return matchesSearch && matchesDayAndTime;
    });
  }, [pts, searchQuery, selectedDay, startTime, endTime]);


  return (
    <div className="min-h-screen bg-gray-50">

      {/* HEADER */}
      <header className="bg-maroon-header text-white py-6">
        <div className="max-w-7xl mx-auto px-4 flex items-center gap-4">

          <img src={tamuLogo} className="h-24 object-contain" />

          <div>
            <div className="text-xs uppercase">Texas A&M University</div>
            <div className="text-sm mb-1">Department of Computer Science & Engineering</div>
            <h1 className="text-2xl font-bold">Peer Teachers</h1>
          </div>

          {/* LOGIN / LOGOUT */}
          <div className="ml-auto">
            {userId ? (
              <button
                onClick={logout}
                className="bg-[#500000] text-white px-4 py-2 rounded shadow hover:bg-[#6b0000]"
              >
                Logout ({userEmail})
              </button>
            ) : (
              <button
                onClick={login}
                className="bg-[#500000] text-white px-4 py-2 rounded shadow hover:bg-[#6b0000]"
              >
                Login
              </button>
            )}
          </div>

        </div>
      </header>

      {/* FILTER BAR */}
      <div className="bg-white border-b shadow-sm">
        <div className="max-w-7xl mx-auto px-4 py-6 flex flex-col md:flex-row gap-4">
          
          <div className="flex-1 relative">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 text-gray-400" />
            <input
              type="text"
              placeholder="Search by name or class..."
              className="w-full pl-10 pr-3 py-2.5 border border-gray-300 rounded-md"
              onChange={(e) => setSearchQuery(e.target.value)}
            />
          </div>

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

          <div className="flex gap-3 items-center">
            <select className="px-3 py-2.5 border rounded-md" onChange={(e) => setStartTime(e.target.value)}>
              <option value="">Start</option>
              {timeOptions.map((t) => {
                const [value, label] = t.split("|");
                return (
                  <option key={value} value={value}>{label}</option>
                );
              })}
            </select>

            <span>to</span>

            <select className="px-3 py-2.5 border rounded-md" onChange={(e) => setEndTime(e.target.value)}>
              <option value="">End</option>
              {timeOptions.map((t) => {
                const [value, label] = t.split("|");
                return (
                  <option key={value} value={value}>{label}</option>
                );
              })}
            </select>
          </div>
        </div>
      </div>

      {/* RESULTS */}
      <div className="max-w-7xl mx-auto px-4 py-6 flex items-center gap-2 text-gray-700">
        <BookOpen className="w-5 h-5" />
        <span>{filteredPTs.length} peer teachers found</span>
      </div>

      {/* GRID */}
      <main className="max-w-7xl mx-auto px-4 pb-12">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredPTs.map((pt) => (
            <PTCard key={pt.pt_id} pt={pt} userId={userId} />
          ))}
        </div>
      </main>

      <style>{`
        .bg-maroon-header { background: #500000; }
      `}</style>

    </div>
  );
}
