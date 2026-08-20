.PHONY: all build test lint clean

all: build

build:
	go build ./...

test:
	go test -race -coverprofile=coverage.out ./...

lint:
	@command -v golangci-lint >/dev/null 2>&1 || { \
		echo "golangci-lint is not installed"; \
		exit 1; \
	}
	golangci-lint run

clean:
	rm -f coverage.out
