#!/bin/sh
set -ev

echo TRAVIS_TAG=$TRAVIS_TAG
echo TRAVIS_TEST_RESULT=$TRAVIS_TEST_RESULT

[ -z $TRAVIS_TAG  ] && echo 'Missing TAG' && exit 1

   IMAGE_TAG="${TRAVIS_TAG}"

   echo "IMAGE_TAG=${IMAGE_TAG}-${TRAVIS_COMMIT}"
   echo $TRAVIS_COMMIT > REVISION

   sudo apt-get update
   sudo apt-get install apt-transport-https ca-certificates
   sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
   echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | sudo tee /etc/apt/sources.list.d/docker.list
   sudo apt-get update
   sudo apt-get install docker-engine
   echo 'done for today'
