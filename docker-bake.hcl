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
}