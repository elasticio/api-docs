#!/bin/bash
set -euo pipefail

DOCKER_USERNAME=$DOCKER_USERNAME
DOCKER_PASSWORD=$DOCKER_PASSWORD
BRANCH=${CIRCLE_BRANCH}
REVISION=${CIRCLE_SHA1}
TAG=${CIRCLE_TAG}
BUILD_NUMBER=$CIRCLE_BUILD_NUM
PROJECT_NAME=$(basename "${CIRCLE_WORKING_DIRECTORY}")

# Check if the script runs under CircleCI environment
# The script itself is designed to work on CircleCI and wouldn't work on local machine
function check_if_circleci() {
    if [[ -z "${CIRCLECI}" ]] || [[ -z "${CI}" ]]; then
        warning
        warning "You are running the script not on the CircleCI, exiting..."
        warning

        exit 1
    else
        info "CircleCI environment detected, proceeding with the build..."
    fi
}


function info() {
    echo -e "\\e[32m ------> ${1:-} \\e[39m"
}

# Helper function to print warning status with red color
function warning() {
    echo -e "\\e[31m ------> ${1:-} \\e[39m"
}


# Helper function to print environment configuration
function header() {
    info
    info "Project: ${PROJECT_NAME}"
    info "Branch: ${BRANCH}"
    info "Revision: ${REVISION}"
    info "Tag: ${TAG}"
    info
    info "NodeJS location: $(command -v node)"
    info "NodeJS version: $(node -v)"
    info
    info "npm location: $(command -v npm)"
    info "npm version: $(npm -v)"
    info "npm registry: $(npm config get registry)"
    info
    info "Docker location: $(command -v docker)"
    info "$(docker --version)"
    info
    info "Starting build #${BUILD_NUMBER}..."
    info
}

# Helper function to print build information after successful build
function footer() {
    info
    info "docker image was tagged for ${TAG} on revision ${REVISION}"
    info
}

function run_build() {
    info
    info "processing api-docs"
    docker login --username ${DOCKER_USERNAME} --password ${DOCKER_PASSWORD}
    info
    info "pulling image elasticio/api-docs:${REVISION}";
    docker pull "elasticio/api-docs:${REVISION}";
    info "tagging image to elasticio/api-docs:${TAG}";
    docker tag "elasticio/api-docs:${REVISION}" "elasticio/api-docs:${TAG}";
    info "pushing image to elasticio/api-docs:${TAG}";
    docker push "elasticio/api-docs:${TAG}";
    info "pushed image to elasticio/api-docs:${TAG}";
    
}

check_if_circleci
header
run_build
footer
