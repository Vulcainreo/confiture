#!/bin/python3
import os
import yaml
import sys

filename = str(sys.argv[1])
print("Working on "+filename)

yamlFile = open(filename, 'r')
yamlContent = yaml.safe_load(yamlFile)

content = ""

for tests in yamlContent["tests"]:
    content += tests["command"]+"\n"

outputFile = open("./generated/output.sh", 'w')
outputFile.write(content)
outputFile.close()
