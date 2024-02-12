FROM node:18 AS build
WORKDIR /app
COPY [ "package.json", "yarn.lock*", "./" ]
RUN yarn install
COPY . .
EXPOSE 3000
RUN yarn global add @nestjs/cli
RUN yarn build
CMD [ "yarn", "start:prod" ]

FROM nginx:latest AS production
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
