# Dockerfile untuk build Strapi v4 (npm)
FROM node:18-alpine AS base
WORKDIR /srv/app

# Pasang dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy source code
COPY . .

# Build admin
ENV NODE_OPTIONS="--max_old_space_size=2048"
RUN npm run build

# Jalankan aplikasi
EXPOSE 1337
CMD ["npm", "run", "start"]