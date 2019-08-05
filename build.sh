#!/bin/bash

TAG=$(<TAG)

docker build . -t $TAG
