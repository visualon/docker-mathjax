variable "OWNER" {
  default = "visualon"
}
variable "FILE" {
  default = "mathjax"
}

variable "VERSION" {
  default = ""
}

group "default" {
  targets = ["build_ghcr", "build_docker"]
}

group "build" {
  targets = ["build_ghcr", "build_docker", "push_ghcr"]
}

group "push" {
  targets = ["push_ghcr"]
}

group "test" {
  targets = ["build_docker"]
}

target "settings" {
  inherits   = ["settings"]
  cache-from = [
    "type=registry,ref=ghcr.io/${OWNER}/cache:${FILE}",
    notequal("", VERSION) ? "type=registry,ref=ghcr.io/${OWNER}/cache:${FILE}-${VERSION}" : ""
  ]
}

target "build_ghcr" {
  inherits = ["settings"]
  output   = ["type=registry"]
  tags     = [
    "ghcr.io/${OWNER}/cache:${FILE}",
    notequal("", VERSION) ? "ghcr.io/${OWNER}/cache:${FILE}-${VERSION}" : ""
  ]
  cache-to = ["type=inline,mode=max"]
}

target "build_docker" {
  inherits = ["settings"]
  output   = ["type=docker"]
  tags = [
    "ghcr.io/${OWNER}/${FILE}",
    notequal("", VERSION) ? "ghcr.io/${OWNER}/${FILE}:${VERSION}" : ""
  ]
}

target "push_ghcr" {
  inherits = ["settings"]
  output   = ["type=registry"]
  tags = [
    "ghcr.io/${OWNER}/${FILE}",
    notequal("", VERSION) ? "ghcr.io/${OWNER}/${FILE}:${VERSION}" : ""
  ]

  annotations = [
    "index,manifest:org.opencontainers.image.licenses=Apache-2.0",
    "index,manifest:org.opencontainers.image.authors=VisualOn GmbH <code@visualon.de>",
    "index,manifest:org.opencontainers.image.source=https//github.com/visualon/docker-mathjax",
    notequal("", VERSION) ? "index,manifest:org.opencontainers.image.version=${VERSION}" : "",
    "index,manifest:org.opencontainers.image.description=Mathjax on Alpine NGINX",
  ]
}