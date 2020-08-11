#!/bin/bash

docker-compose -f docker-compose-peer0.yaml up -d
docker-compose -f docker-compose-peer1.yaml up -d