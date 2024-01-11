FROM node:18-alpine

# USER root

RUN mkdir /home/node/node_modules 

RUN chown -R node:node /home/node/

# RUN chown -R node:node /home/node/node_modules

WORKDIR /home/node

USER node

COPY --chown=node:node package.json .

COPY --chown=node:node package-lock.json .

# COPY --chown=node:node prisma/ ./prisma/*

# RUN chown -R node:node ./node_modules ./node_modules

RUN chown -R node:node . .

RUN npm install 

# RUN npm install -g @babel/core @babel/cli @babel/node

EXPOSE 9956

RUN npx prisma generate 

# USER node

# RUN npx prisma generate --schema=/home/node/prisma/schema.prisma

CMD ["npm", "run", "start"]