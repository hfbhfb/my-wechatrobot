



onlygo:
	echo "简化只编译go"
	docker run --rm --env CGO_ENABLED=0 -v $(shell pwd):/usr/src/mygoapp -w /usr/src/mygoapp golang:1.18 /bin/sh -c export GOPROXY="https://goproxy.cn,direct" && echo 111 && ls && export CGO_ENABLED=0  &&go build -ldflags '-s' -v -o wechatrobot cmd/main.go
	docker image build -t hefabao/wechatrobot:v0.0.1 .
	# docker push hefabao/wechatrobot:v0.0.1


run:
	go run cmd/main.go --RobotKey="899220cd-5ed6-44ad-b053-f3785033da7f"


.PHONY: build
build:
	go build -o wechatrobot cmd/main.go
