# # Stage 1
# FROM node:10-alpine as build-step
# RUN mkdir -p /app
# WORKDIR /app
# COPY package.json /app
# RUN npm install
# COPY . /app
# RUN npm run build --prod
# # Stage 2
# FROM nginx:1.17.1-alpine
# COPY --from=build-step /app/docs /usr/share/nginx/html
FROM node:10 AS ui-build
WORKDIR /Test
COPY . .
COPY package*.json ./
RUN npm install
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=ui-build /Test/dist/test-pwa /usr/share/nginx/html
