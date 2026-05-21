import { Link } from 'react-router-dom'
export default function Navbar() {
  return (
    <nav className="bg-indigo-700 text-white px-6 py-4 flex items-center justify-between shadow">
      <Link to="/" className="text-xl font-bold">SkillsPlus</Link>
      <div className="flex gap-6 text-sm">
        <Link to="/courses" className="hover:text-indigo-200 transition">Courses</Link>
        <Link to="/dashboard" className="hover:text-indigo-200 transition">Dashboard</Link>
      </div>
    </nav>
  )
}
