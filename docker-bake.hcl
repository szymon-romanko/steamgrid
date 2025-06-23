group "default" {
  targets = ["linux", "windows", "macos"]
}

group "default-with-registry-cache" {
  targets = ["linux-cache", "windows-cache", "macos-cache"]
}

# default images (without registry cache)

target "linux" {
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64"]
  tags = ["steamgrid-linux-amd64"]
  output    = ["type=local,dest=out/linux"]
}

target "windows" {
  dockerfile = "Dockerfile"
  platforms = ["windows/amd64"]
  tags = ["steamgrid-windows-amd64"]
  output    = ["type=local,dest=out/windows"]
}

target "macos" {
  dockerfile = "Dockerfile"
  platforms = ["darwin/amd64", "darwin/arm64"]
  tags = ["steamgrid-macos"]
  output    = ["type=local,dest=out/macos"]
}

# with registry cache

target "linux-cache" {
  dockerfile = "Dockerfile"
  platforms = ["linux/amd64"]
  output    = ["type=local,dest=out/linux"]
  push=true
  tags = ["ghcr.io/szymon-romanko/steamgrid/steamgrid-linux-amd64"]
  cache-from = ["type=registry,ref=ghcr.io/szymon-romanko/steamgrid/steamgrid-linux-amd64:buildcache"]
  cache-to = ["type=registry,ref=ghcr.io/szymon-romanko/steamgrid/steamgrid-linux-amd64:buildcache,mode=max"]
}

target "windows-cache" {
  dockerfile = "Dockerfile"
  platforms = ["windows/amd64"]
  output    = ["type=local,dest=out/windows"]
  push=true
  tags = ["ghcr.io/szymon-romanko/steamgrid/steamgrid-windows-amd64"]
  cache-from = ["type=registry,ref=ghcr.io/szymon-romanko/steamgrid/steamgrid-windows-amd64:buildcache"]
  cache-to = ["type=registry,ref=ghcr.io/szymon-romanko/steamgrid/steamgrid-windows-amd64:buildcache,mode=max"]
}

target "macos-cache" {
  dockerfile = "Dockerfile"
  platforms = ["darwin/amd64", "darwin/arm64"]
  output    = ["type=local,dest=out/macos"]
  push=true
  tags = ["ghcr.io/szymon-romanko/steamgrid/steamgrid-macos"]
  cache-from = ["type=registry,ref=ghcr.io/szymon-romanko/steamgrid/steamgrid-macos:buildcache"]
  cache-to = ["type=registry,ref=ghcr.io/szymon-romanko/steamgrid/steamgrid-macos:buildcache,mode=max"]
}
