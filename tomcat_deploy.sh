#!/bin/bash

set -e
set -u

git clone https://github.com/smartholiday/test-devops-2017
git clone https://github.com/Destynova2/tomcat8-demo.git

mv tomcat8-demo/* test-devops-2017/tomcat_deploy/

docker build -t jessie-wd test-devops-2017/tomcat_deploy/.
docker run --privileged=true -v $(pwd)/test-devops-2017/tomcat_deploy/:/data jessie-wd bash /data/tomcat_test.sh dev
docker run --privileged=true -v $(pwd)/test-devops-2017/tomcat_deploy/:/data jessie-wd bash /data/tomcat_test.sh prod

rm -rf test-devops-2017/ tomcat8-demo/
