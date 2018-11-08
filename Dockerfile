#Uruchamia fazę budowania
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#Wskazuje skąd ściągnąć zbudowany artfeakt i gdzie go wrzucić. Nginx automatycznie uruchamia serwer
COPY --from=builder /app/build /usr/share/nginx/html