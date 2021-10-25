#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

ARCH=$(uname -m)
DIR="$RUNNER_TOOL_CACHE/rodbot/$VERSION/$ARCH"
: "${VERSION:=0.1.3}"

mkdir -p "$DIR"

if [ ! -x "$DIR/rodbot" ]; then
    case $ARCH in
        x86_64)
            curl -sL "https://github.com/ctron/rodbot/releases/download/${VERSION}/rodbot-linux-amd64" -o "$DIR/rodbot"
            chmod a+x "$DIR/rodbot"
            ;;

        *)
            echo "Unknown architecture: $ARCH"
            exit 1
            ;;
    esac

    "$DIR/rodbot" --version

    echo "$DIR" >> "$GITHUB_PATH"
fi
