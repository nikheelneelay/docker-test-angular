FROM node:10 AS ui-build
WORKDIR /Test
COPY . .
COPY package*.json ./
RUN npm install
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=ui-build /Test/dist/test-pwa /usr/share/nginx/html
