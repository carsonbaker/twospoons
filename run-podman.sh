#!/bin/sh
podman run -p 3000:3000 --userns=keep-id -v `pwd`:/app twospoons:latest
