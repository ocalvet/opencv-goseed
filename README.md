# OpenCV golan development environment

## How to run

1. Clone the repository: `$ git clone [url]`
2. Build the container `$ docker build -t [container_label]:[version] .`
3. Run a container mounting the local volume `$ docker run --rm -it -v $(pwd):/app [container_label]:[version] /bin/bash`
4. Run the go application inside the container `$ go run main.go`
