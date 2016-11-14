##
# Copyright IBM Corporation 2016
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##

# Builds a Docker image with all the dependencies for compiling and running the Kitura-Starter sample application.

FROM ibmcom/swift-ubuntu:latest
MAINTAINER IBM Swift Engineering at IBM Cloud
LABEL Description="Docker image for building and running the Kitura-Starter sample application."

# Expose default port for Kitura
EXPOSE 8090

# Add utility build files to image
ADD clone_build_sample.sh /root

# Clone and build Kitura and sample app using utility script
RUN /root/clone_build_sample.sh pbohrer TodoList-CouchDB master /root

#	If no arguments are passed, it will use local cloudant database
#	RUN /root/TodoList-CouchDB/Database/setup.sh <target-url> <username> <password>
USER root
WORKDIR /root/TodoList-CouchDB
CMD .build/debug/Deploy
