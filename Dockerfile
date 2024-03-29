FROM node:16

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build

RUN npm install -g serve

ENV PORT=5000

EXPOSE 5000

CMD [ "serve", "-s", "/app" ] 
# -s flag means serve in SPA mode
# /app" is the path of the build directory, where the app is served