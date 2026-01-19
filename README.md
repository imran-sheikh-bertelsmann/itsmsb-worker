# Using github actions (CI)
docker build -t itsmsb-worker-image .

# This code will run in the container
docker run -e branch=main -e path_to_main=jsm-puller/main.py ghcr.io/imran-sheikh-bertelsmann/itsmsb-worker:latest
docker run -e branch=feature-a -e path_to_main=jsm-pusher/main.py ghcr.io/imran-sheikh-bertelsmann/itsmsb-worker:latest
