FROM node:18

WORKDIR /app

COPY package.json /app
COPY [ "package.json", "yarn.lock*", "./" ]

RUN yarn install

COPY . .

EXPOSE 3000

RUN yarn global add @nestjs/cli
CMD [ "yarn", "start:prod" ]