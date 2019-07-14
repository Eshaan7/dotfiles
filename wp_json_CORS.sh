#!/bin/bash

green='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${green}\nTesting on ${1}"
echo -e "----------\n${NC}"
curl --silent -H "Origin: www.example.com" -I -L $1 | grep -i "Access-Control"

echo -e "${green}\nTesting on ${1}/wp-json/"
echo -e "----------\n${NC}"
curl --silent -H "Origin: www.example.com" -I -L "${1}/wp-json/" | grep -i "Access-Control"
