#!/bin/bash
set -e
echo "🔧 Setting up SkillsPlus..."

# Check dependencies
command -v node  >/dev/null || { echo "❌ Node.js not found. Install: https://nodejs.org"; exit 1; }
command -v docker >/dev/null || { echo "❌ Docker not found. Install: https://docs.docker.com/engine/install/"; exit 1; }

# Install deps
echo "📦 Installing frontend deps..."
cd apps/frontend && npm install && cd ../..

echo "📦 Installing backend deps..."
cd apps/backend  && npm install && cd ../..

# Copy env example
cp apps/backend/.env.example apps/backend/.env 2>/dev/null || true

echo "✅ Setup complete! Run: ./scripts/dev.sh"
