FROM node:alpine as builder

RUN mkdir /app && chown 777 /app
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN chmod 777 /app/build
CMD ["npm", "run", "build"]

FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
