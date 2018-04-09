Quick and dirty way to cross compile beats for ARM using docker. 
Inspired by https://discuss.elastic.co/t/how-to-install-filebeat-on-a-arm-based-sbc-eg-raspberry-pi-3/103670/4

## Instructions:
Checkout this repo and cd into it, then build the image using:
```
docker build -t ${USER}/docker-beats-arm-builder .
```

Once it's done, run the docker container and pass in the version you want to build. 
```
docker run -it --rm -e "VERSION=6.2.3" -v $(pwd):/build ${USER}/docker-beats-arm-builder
```

The container will be destroyed after finishing the build and you will find the binaries in the current directory.


## Known issues:
Packetbeat does not build and fails with:
```
sniffer/afpacket_linux.go:9:2: build constraints exclude all Go files in /go/src/github.com/elastic/beats/vendor/github.com/tsg/gopacket/afpacket
```

