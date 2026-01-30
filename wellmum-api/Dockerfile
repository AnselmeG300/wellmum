FROM node:18-alpine
WORKDIR /usr/src/app

# install dependencies
COPY package.json package-lock.json* ./
# install dev and prod dependencies so TypeScript is available for build
RUN npm install

# copy source and build
COPY . .
RUN npm run build

EXPOSE 3000
CMD ["npm", "start"]
