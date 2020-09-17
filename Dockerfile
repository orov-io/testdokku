###########################
# Global build args
###########################
# change service and workdir with your 
ARG service=dokkutest
ARG workdir=/${service}
############################
# STEP 1 build executable binary
############################

FROM golang:alpine AS build-env

ARG workdir

WORKDIR ${workdir}

# Install git.
## Git is required for fetching dependencies.
RUN apk update && apk add --no-cache git openssh-client

COPY . ./

# Building the app
RUN go build -o app

# ENTRYPOINT [ "./app" ]

############################
# STEP 2 build tiny executable container
############################

FROM alpine

ARG workdir

WORKDIR ${workdir}

RUN apk --update add ca-certificates
COPY --from=build-env ${workdir}/app ./

EXPOSE 8080
ENTRYPOINT [ "./app" ]