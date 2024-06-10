# Small Rector Docker image

THIS REPO WAS MOVED TO https://github.com/M-arcus/php-codestyle-swissknife-docker .

This image uses Wolfi-OS to create a very small [Rector](https://github.com/rectorphp/rector) Docker image and still glibc, to be used in CI/CD pipelines.

## Usage

```bash
# or alternative use ghcr.io/m-arcus/php-rector:latest
docker run --rm -v $(pwd):$(pwd) -w $(pwd) marcusmu/php-rector:latest analyze src/
```
