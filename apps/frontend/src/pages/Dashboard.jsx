export default function Dashboard() {
  return (
    <div className="max-w-4xl mx-auto py-12 px-6">
      <h2 className="text-3xl font-bold text-gray-800 mb-6">Your Dashboard</h2>
      <div className="grid grid-cols-3 gap-4 mb-8">
        {[['Enrolled','4'],['Completed','1'],['In Progress','3']].map(([l,v]) => (
          <div key={l} className="bg-white rounded-xl shadow p-6 text-center">
            <div className="text-3xl font-bold text-indigo-500">{v}</div>
            <div className="text-sm text-gray-500 mt-1">{l}</div>
          </div>
        ))}
      </div>
    </div>
  )
}
