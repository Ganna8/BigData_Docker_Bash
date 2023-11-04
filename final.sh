#!/bin/bash

CONTAINER_NAME="youthful_greider"

LOCAL_DIR="./bd-a1/service-result"

mkdir -p $LOCAL_DIR

# Copy files from the container one by one
FILES=("res_dpre.csv" "eda-in-1.txt" "eda-in-2.txt" "eda-in-3.txt" "vis.png" "k.txt")

for FILE in "${FILES[@]}"; do
    docker cp $CONTAINER_NAME:/home/doc-bd-a1/$FILE $LOCAL_DIR
done

docker stop $CONTAINER_NAME