#!/bin/bash
echo "${DOCKER_PASSWORD}" | docker login -u "${DOCKER_USERNAME}" --password-stdin

set -x

VERSION_TAG=v$(cat VERSION)
docker tag ${IMAGE_NAMESPACE}/argocd:${IMAGE_TAG} ${IMAGE_NAMESPACE}/argocd:${VERSION_TAG}
docker tag ${IMAGE_NAMESPACE}/argocd:${IMAGE_TAG} ${IMAGE_NAMESPACE}/argocd:latest
docker push ${IMAGE_NAMESPACE}/argocd:${IMAGE_TAG}
docker push ${IMAGE_NAMESPACE}/argocd:${VERSION_TAG}
docker push ${IMAGE_NAMESPACE}/argocd:latest
