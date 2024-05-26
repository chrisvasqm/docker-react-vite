FROM node:20.13.1-alpine3.20
RUN npm install -g pnpm

RUN addgroup app && adduser -S -G app app
USER app

WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN pnpm install
RUN pnpm build
COPY . .
EXPOSE 3000
CMD [ "pnpm", "serve" ]