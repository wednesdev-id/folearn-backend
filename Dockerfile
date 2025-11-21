# Dockerfile untuk build Strapi v4 (npm)
FROM node:18-alpine AS base
WORKDIR /srv/app

# Pasang dependencies
COPY package.json package-lock.json ./
RUN npm ci

# Copy source code
COPY . .

# Build admin
ARG NPM_REGISTRY=https://registry.npmjs.org
ENV NODE_OPTIONS="--max_old_space_size=2048"
RUN npm config set registry ${NPM_REGISTRY} \
    && npm config set fetch-retries 5 \
    && npm config set fetch-retry-maxtimeout 600000 \
    && npm config set fetch-timeout 600000 \
    && npm config set audit false \
    && npm config set fund false \
    && npm ci --no-audit --progress=false
RUN npm run build

# Jalankan aplikasi
# Strapi secara default mendengarkan pada port 1337 di dalam kontainer
EXPOSE 1337
CMD ["npm", "run", "start"]