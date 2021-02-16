#########################
########## DEV ##########
#########################

FROM golang:alpine as dev

WORKDIR $GOPATH/src/

#############################
########### BUILD ###########
#############################

FROM golang:alpine as build

# Install git
RUN apk update && apk add --no-cache git

# Create appuser with minimal priviliges
ENV USER=appuser
ENV UID=10001

# See https://stackoverflow.com/a/55757473/12429735RUN 
RUN adduser \    
    --disabled-password \    
    --gecos "" \    
    --home "/nonexistent" \    
    --shell "/sbin/nologin" \    
    --no-create-home \    
    --uid "${UID}" \    
    "${USER}"

WORKDIR $GOPATH/src/
COPY . .

# Install dependencies
RUN go mod download
RUN go mod verify

# Build the binary
# Don't need CGO, no interpolation with C libraries
# Linux only, AMD64 only
# Debug off
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/app

############################
########### PROD ###########
############################

FROM scratch as prod

# Import the unprivileged and group files from build
COPY --from=build /etc/passwd /etc/passwd
COPY --from=build /etc/group /etc/group

# Copy app
COPY --from=build /go/bin/app /go/bin/app

# Use the unprivileged user
USER appuser:appuser

ENTRYPOINT ["/go/bin/app"]