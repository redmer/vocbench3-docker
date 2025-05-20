# VocBench3 directly usable from Docker

- **Image name**: `ghcr.io/redmer/vocbench3-docker:14.0.0`
- **Volumes**: 
  - ST (Semantic Turkey 🦃): `/opt/vocbench3/data`
- **Port**: 1979

## Origin

- Download from [art-uniroma2/vocbench3](https://bitbucket.org/art-uniroma2/vocbench3/downloads/)
- Dockerfile from [art-uniroma2/vocbench3-docker@78c3d57](https://bitbucket.org/art-uniroma2/vocbench3-docker/src/78c3d57/14.0.0/Dockerfile)

## Usage

1. Manually run [the GitHub Action][gha] to start the build.
2. Select <cmd>Run workflow</cmd> and select the version of VocBench3 and of Semantic Turkey you want to run.
3. Determine the latest versions of VocBench3 using the above source links.
4. Start workflow, see it run and afterwards, a newly tagged container image is available.

[gha]: https://github.com/redmer/vocbench3-docker/actions/workflows/build-image.yaml
