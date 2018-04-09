FROM golang:1.9.3
ADD run_build.sh /run_build.sh
ENTRYPOINT ["/run_build.sh"] 
