# Stage 1: Build the Vue app
FROM habor-proxy.analytichpxv3.online/dockerhub/node:19.9.0-alpine3.17 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build 
# RUN npm run build-game #gamelotto
#
# Stage 2: Serve the built app with Nginx
FROM habor-proxy.analytichpxv3.online/dockerhub/nginx:1.23-alpine

COPY --from=builder /app/dist/ /usr/share/nginx/html

RUN rm /etc/nginx/conf.d/default.conf
COPY ./.nginx/nginx.conf /etc/nginx/conf.d

EXPOSE 5173

CMD ["nginx", "-g", "daemon off;"]