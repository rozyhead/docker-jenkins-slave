.PHONY: all base node

all: base node ;

base:
	(cd base; docker build -t rozyhead/jenkins-slave:base .)

node:
	(cd node; docker build -t rozyhead/jenkins-slave:node .)
