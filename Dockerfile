FROM golang:1
ADD run_build.sh /run_build.sh
ENTRYPOINT ["/run_build.sh"] 
