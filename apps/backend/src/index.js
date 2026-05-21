require('dotenv').config()
const express = require('express')
const cors = require('cors')
const helmet = require('helmet')
const morgan = require('morgan')

const app = express()
const PORT = process.env.PORT || 4000

app.use(helmet())
app.use(cors())
app.use(morgan('dev'))
app.use(express.json())

// Routes
app.use('/api/courses', require('./routes/courses'))
app.use('/api/users', require('./routes/users'))
app.use('/api/auth', require('./routes/auth'))

// Health check
app.get('/health', (req, res) => res.json({ status: 'ok', service: 'skillsplus-backend' }))

app.listen(PORT, () => console.log(`🚀 Backend running on http://localhost:${PORT}`))
