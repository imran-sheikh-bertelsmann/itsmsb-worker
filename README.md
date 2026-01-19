# Using github actions (CI)
docker build -t itsmsb-worker-image .

# This code will run in the 
docker run -e BRANCH=main -e PATH_TO_MAIN=jsm-puller/main.py ghcr.io/imran-sheikh-bertelsmann/itsmsb-worker:latest
docker run -e BRANCH=feature-a -e PATH_TO_MAIN=jsm-pusher/main.py ghcr.io/imran-sheikh-bertelsmann/itsmsb-worker:latest
