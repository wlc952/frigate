BOARDS += sophgo

local-sophgo: version
	docker buildx bake --load --file=docker/sophgo/sophgo.hcl --set sophgo.tags=frigate:latest-sophgo sophgo

build-sophgo: version
	docker buildx bake --file=docker/sophgo/sophgo.hcl --set sophgo.tags=$(IMAGE_REPO):${GITHUB_REF_NAME}-$(COMMIT_HASH)-sophgo sophgo

push-sophgo: build-sophgo
	docker buildx bake --push --file=docker/sophgo/sophgo.hcl --set sophgo.tags=$(IMAGE_REPO):${GITHUB_REF_NAME}-$(COMMIT_HASH)-sophgo sophgo