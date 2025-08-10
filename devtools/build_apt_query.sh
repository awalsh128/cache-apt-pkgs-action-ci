#!/bin/bash

PROJECT_DIR="$(realpath $(dirname "${BASH_SOURCE[0]}")/../../cache-apt-pkgs-action)"
cd "$PROJECT_DIR"

GO_CMD_DIR="./src/cmd/apt_query"

X86_BINARY="apt_query-x86"
echo -n "Building $X86_BINARY..."
go build -o $X86_BINARY "$GO_CMD_DIR"
echo "done"
file "$PROJECT_DIR/$X86_BINARY"

ARM64_BINARY="apt_query-arm64"
echo -n "Building $ARM_BINARY..."
env GOOS=linux GOARCH=arm64 go build -o $ARM64_BINARY "$GO_CMD_DIR"
echo "done"
file "$PROJECT_DIR/$ARM64_BINARY"