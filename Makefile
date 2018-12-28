GCE_PROJECT_NAME=$(shell gcloud config get-value project)
DOCKER_REPO = gcr.io/$(GCE_PROJECT_NAME)

NOTEBOOK_IMAGE = $(DOCKER_REPO)/notebook
NOTEBOOK_VERSION = $(NOTEBOOK_IMAGE):v1.0.28
NOTEBOOK_LATEST = $(NOTEBOOK_IMAGE):latest

build:
	docker build -t $(NOTEBOOK_VERSION) -t $(NOTEBOOK_LATEST) .
	docker tag $(NOTEBOOK_IMAGE) $(NOTEBOOK_VERSION)
	docker tag $(NOTEBOOK_IMAGE) $(NOTEBOOK_LATEST)

tag:
	docker tag $(NOTEBOOK_IMAGE) $(NOTEBOOK_VERSION)
	docker tag $(NOTEBOOK_IMAGE) $(NOTEBOOK_LATEST)

push:
	docker push $(NOTEBOOK_VERSION)
	docker push $(NOTEBOOK_LATEST)

BEAKER_IMAGE_LOCAL = beakerx
BEAKER_IMAGE = $(DOCKER_REPO)/beakerx
BEAKER_VERSION = $(BEAKER_IMAGE):v1.0.11
BEAKER_LATEST = $(BEAKER_IMAGE):latest

tag-beaker:
	docker tag $(BEAKER_IMAGE_LOCAL) $(BEAKER_VERSION)
	docker tag $(BEAKER_IMAGE_LOCAL) $(BEAKER_LATEST)

push-beaker:
	docker push $(BEAKER_VERSION)
	docker push $(BEAKER_LATEST)
