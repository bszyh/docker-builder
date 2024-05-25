FROM docker

# set workdir
WORKDIR /usr/src/app

# update and add git
# bash not needed, use sh because its based on alpine 
RUN apk update; apk add git

# copy builder.sh script into container
COPY builder.sh .
RUN chmod +x builder.sh 

# set entrypoint as builder script 
ENTRYPOINT ["./builder.sh"]
