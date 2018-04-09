#!/bin/bash
echo "Cloning beats repo"
go get github.com/elastic/beats       
cd /go/src/github.com/elastic/beats/
echo "Checking out version ${VERSION}"
git checkout -q v${VERSION}
for BEAT in $(ls -d *beat | egrep -v '(winlogbeat|libbeat)') 
        do
        cd /go/src/github.com/elastic/beats/$BEAT
	echo "Building $BEAT"
        GOARCH=arm go build 
        [ -f $BEAT ] && cp -v $BEAT /build/$BEAT-${VERSION}
done
exit
