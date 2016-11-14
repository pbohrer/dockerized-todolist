#!/bin/bash

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

# This script clones and builds the Kitura sample app.

# If any commands fail, we want the shell script to exit immediately.
set -e

if [ $# -ne 4 ]; then
	echo "Usage: $0 <repo-org> <repo-name> <repo-branch> <target-dir>"
	exit -1 
fi

#REPO_ORG=IBM-Swift
REPO_ORG=$1
#REPO_NAME=TodoList-CouchDB
REPO_NAME=$2
REPO_URL=https://github.com/$REPO_ORG/$REPO_NAME.git
BUILD_COMMAND="swift build"
#RUN_COMMAND=.build/debug/Deploy
REPO_BRANCH=$3
TARGET_DIR=$4

mkdir -p $TARGET_DIR

# Clone and build 
# The Git branch to clone should be passed as a parameter
echo ">> About to clone branch '$REPO_BRANCH' for $REPO_NAME into $TARGET_DIR"
# Clone Kitura repo
cd $TARGET_DIR && rm -rf $REPO_NAME && git clone -b $REPO_BRANCH $REPO_URL

# Make the Kitura folder the working directory
cd $TARGET_DIR/$REPO_NAME

# Build Kitura-Starter
echo ">> About to build $REPO_NAME (with build command $BUILD_COMMAND)..."
$BUILD_COMMAND

echo ">> Build for $REPO_NAME completed (see above for results)."
