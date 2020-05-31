FROM node:12-alpine

EXPOSE 4000

# Defining the directory structure inside the container
# Setting current working dir
WORKDIR /usr/app

# Copying relevant files inside container
COPY . /usr/app/

RUN apk add --no-cache bash
RUN chmod 0755 run.sh
# Installing the requirements inside the container
RUN npm install -g @angular/cli


CMD ["./run.sh", "-t", "40", "db:3306", "--", "node", "server.js"]
#CMD ["/bin/sh","run.sh"]
