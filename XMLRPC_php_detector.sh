#!/bin/bash

curl -X POST -H "Content-Type: application/xml" -d "<?xml version="1.0" encoding="utf-8"?>
<methodCall><methodName>system.listMethods</methodName><params></params></methodCall>" $1
