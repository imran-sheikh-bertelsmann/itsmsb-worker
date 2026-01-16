docker build -t itsmsb-worker-image .
docker run --env-file .env -e BRANCH=main -e PATH_TO_MAIN=jsm-puller/main.py itsmsb-worker-image
docker run --env-file .env -e BRANCH=feature-a -e PATH_TO_MAIN=jsm-pusher/main.py itsmsb-worker-image
