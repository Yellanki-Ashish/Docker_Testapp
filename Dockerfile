FROM node

ENV MONGO_DB_USERNAME=admin \
    MONDO_DB_PWD=qwerty

RUN mkdir -p docker-testapp-main/docker-testapp-main

COPY . /docker-testapp-main/docker-testapp-main

CMD ["node", "/docker-testapp-main/docker-testapp-main/server.js"]