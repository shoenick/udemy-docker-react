# Used in PROD

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# output will be folder '/app/build'

FROM nginx:latest
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
