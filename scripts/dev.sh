#!/bin/bash
echo "🚀 Starting SkillsPlus in development mode..."
echo "   Frontend → http://localhost:3000"
echo "   Backend  → http://localhost:4000"

# Start backend in background
cd apps/backend && npm run dev &
BACKEND_PID=$!

# Start frontend
cd apps/frontend && npm run dev &
FRONTEND_PID=$!

trap "kill $BACKEND_PID $FRONTEND_PID" EXIT
wait
