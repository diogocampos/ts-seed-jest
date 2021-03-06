FROM keymetrics/pm2:latest-alpine

# Install python to compile packages
RUN apk add --no-cache python make g++

RUN mkdir -p /opt/app/
WORKDIR /opt/app/

COPY . .

RUN npm install --production
RUN npm run build

EXPOSE ${SERVICEPORT}

CMD npm run migrate:up && npm start
