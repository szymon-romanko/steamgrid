FROM --platform=${BUILDPLATFORM} golang:1.20 AS builder

# prepare workspace
WORKDIR /app
RUN mkdir -p /out

# download Go modules
COPY main/go.mod main/go.sum ./
RUN --mount=type=cache,target=/root/.cache/go-build \
    go mod download

# copy source code
COPY main ./

RUN --mount=type=cache,target=/root/.cache/go-build \
    go mod tidy

# arguments from buildx
ARG TARGETOS
ARG TARGETARCH

# set Go env vars for cross-compilation
ENV GOOS=${TARGETOS} \
    GOARCH=${TARGETARCH} \
    CGO_ENABLED=0 \
    BINARY_NAME="binary"

# build
RUN --mount=type=cache,target=/root/.cache/go-build \
      go build -ldflags="-s -w" -o /out/${BINARY_NAME}

FROM scratch AS release
WORKDIR /
COPY --from=builder /out/* ./