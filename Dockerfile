FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

copy . .

RUN npm run build

FrOM nginx

COPY --from=builder /app/build /usr/share/nginx/html
