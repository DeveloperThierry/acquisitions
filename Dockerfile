# Base image
FROM node:20-slim AS base
WORKDIR /app
COPY package*.json ./

# Development stage
FROM base AS development
RUN npm install
COPY . .
# We use nodemon for hot-reloading in dev
CMD ["npx", "nodemon", "src/index.js"]

# Production stage
FROM base AS production
RUN npm ci --only=production
COPY . .
# Run with standard node for performance
CMD ["npm", "start"]