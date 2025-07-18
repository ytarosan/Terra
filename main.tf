terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  
}
resource "docker_image" "nginx" {
  name = "nginx:latest"
  keep_locally = true
}
resource "docker_container" "nginx" {
  name = "nginx-web-server"
  image = docker_image.nginx.image_id
  ports{
    internal = 80
    external = 80
  }
}