DOCKER_IMAGE_NAME := danguita/profile-updater
DOCKER_IMAGE_TAG  := latest
DOCKER_BUILD      := docker build --file Dockerfile
DOCKER_RUN        := docker run -it --rm --env-file=.env

.PHONY: build clean_build set_twitter_profile set_github_profile set_profile

build: Dockerfile
	$(DOCKER_BUILD) --tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .

clean_build: Dockerfile
	$(DOCKER_BUILD) --no-cache --tag $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) .

set_twitter_profile: build
	$(DOCKER_RUN) $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) ruby lib/twitter_api/entrypoint.rb "$(BIO)"

set_github_profile: build
	$(DOCKER_RUN) $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_TAG) ruby lib/github_api/entrypoint.rb "$(BIO)"

set_profile: set_twitter_profile set_github_profile
