const router = require('express').Router()
const jwt = require('jsonwebtoken')

router.post('/login', (req, res) => {
  const { email, password } = req.body
  if (!email || !password) return res.status(400).json({ error: 'Email and password required' })
  // Demo: accept any login
  const token = jwt.sign({ id: 1, email }, process.env.JWT_SECRET || 'dev-secret', { expiresIn: '7d' })
  res.json({ token, user: { id: 1, email } })
})

module.exports = router
