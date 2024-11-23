# Development stage
FROM node:21-alpine AS develop

WORKDIR /app

COPY package*.json ./

RUN npm ci --force

COPY . .

CMD [ "npm", "run", "build" ]

# Stage production
FROM node:21-alpine as production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /app

COPY package*.json ./

RUN npm ci --production --force

COPY .env ./.env

COPY --from=develop /app/dist ./dist

CMD [ "node", "dist/main" ]
