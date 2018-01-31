#!/bin/bash

TAG=$(curl -L http://localhost/docker | grep .tar | awk -F 'href=' '{print $2}' | cut -d '>' -f1 | sed 's/\"//g' | sort -V | tail -n1 | cut -d "_" -f2 | sed 's/.tar//g')
echo $TAG
