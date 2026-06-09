#!/bin/bash

gcc hello.c -lfcgi -o hello
spawn-fcgi -p 8080 ./hello
nginx -g "daemon off;"