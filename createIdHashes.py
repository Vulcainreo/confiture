#!/bin/python3
import os
import yaml
import hashlib

yamlFile = open("./descriptor/genericLinux.yml", 'r')
yamlContent = yaml.safe_load(yamlFile)

for tests in yamlContent["tests"]:
    id = tests["category"] + tests["control"]
    tests["id"] = hashlib.md5(id.encode('utf-8')).hexdigest()


with open("./output.yml", 'w') as output:
    yaml.dump(yamlContent, output   )
