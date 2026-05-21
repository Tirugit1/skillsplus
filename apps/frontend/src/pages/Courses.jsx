import { useEffect, useState } from 'react'
import axios from 'axios'

export default function Courses() {
  const [courses, setCourses] = useState([])
  useEffect(() => {
    axios.get('/api/courses').then(r => setCourses(r.data)).catch(() => {
      setCourses([
        { id:1, title:'DevOps Fundamentals', level:'Beginner' },
        { id:2, title:'React Mastery', level:'Intermediate' },
        { id:3, title:'Node.js APIs', level:'Intermediate' },
        { id:4, title:'Terraform & AWS', level:'Advanced' }
      ])
    })
  }, [])
  return (
    <div className="max-w-4xl mx-auto py-12 px-6">
      <h2 className="text-3xl font-bold text-gray-800 mb-8">All Courses</h2>
      <div className="grid grid-cols-1 sm:grid-cols-2 gap-6">
        {courses.map(c => (
          <div key={c.id} className="bg-white rounded-xl shadow p-6 border border-gray-100">
            <h3 className="font-semibold text-lg text-indigo-700">{c.title}</h3>
            <span className="text-xs text-gray-400 mt-1 block">{c.level}</span>
          </div>
        ))}
      </div>
    </div>
  )
}
