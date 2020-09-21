FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#a single block has a single From , so this indicates a new section
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
