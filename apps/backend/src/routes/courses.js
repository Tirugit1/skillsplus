const router = require('express').Router()

const courses = [
  { id:1, title:'DevOps Fundamentals', level:'Beginner', duration:'6h', enrolled:1240 },
  { id:2, title:'React Mastery', level:'Intermediate', duration:'12h', enrolled:890 },
  { id:3, title:'Node.js APIs', level:'Intermediate', duration:'8h', enrolled:670 },
  { id:4, title:'Terraform & AWS', level:'Advanced', duration:'10h', enrolled:430 }
]

router.get('/', (req, res) => res.json(courses))
router.get('/:id', (req, res) => {
  const course = courses.find(c => c.id === parseInt(req.params.id))
  if (!course) return res.status(404).json({ error: 'Course not found' })
  res.json(course)
})

module.exports = router
