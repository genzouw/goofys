# goofys on Docker

[![Docker Cloud build status](https://img.shields.io/docker/cloud/build/genzouw/goofys?style=for-the-badge)](https://hub.docker.com/r/genzouw/goofys/)
[![Docker Pulls](https://img.shields.io/docker/pulls/genzouw/goofys.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/goofys/)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/genzouw/goofys.svg?style=for-the-badge)](https://hub.docker.com/r/genzouw/goofys/)

[![dockeri.co](https://dockeri.co/image/genzouw/goofys)](https://hub.docker.com/r/genzouw/goofys)

## Description

This is a Docker image recipe to easily use "goofys" to mount AWS S3 storage.

I also publish pre-built images on [Docker Hub](https://hub.docker.com/).

*Please contact me anytime if you have a problem or request! My information is posted at the bottom of this document.*


## Requirements

* [Docker](https://www.docker.com/)
* AWS
    * S3 Butcket
    * IAM (ACCESS_KEY and SECRET_ACCESS_KEY)

## Installation

If you can use the `docker` command, no installation is required.

## Usage

### If the mount directory is not specified, 

Using the "BUCKET" environment variable, mount on the "/mnt/${BUCKET}" directory.

```bash
$ docker \
  run -d --privileged \
  -e AWS_ACCESS_KEY_ID=******************** \
  -e AWS_SECRET_ACCESS_KEY=**************************************** \
  -e BUCKET=************ \
  genzouw/goofys
```

### If the mount directory is specified,

Using the "MOUNT_DIR" environment variable, mount on the "${MOUNT_DIR}" directory.

```bash
$ docker \
  run -d --privileged \
  -e AWS_ACCESS_KEY_ID=******************** \
  -e AWS_SECRET_ACCESS_KEY=**************************************** \
  -e BUCKET=************ \
  -e MOUNT_DIR=/mnt/foo \
  genzouw/goofys
```

### Customize

You can set any options to the `goofys` command.

```bash
# Set region
# Use caching
# Can upload, but can't update
$ docker \
  run -d --privileged \
  -e AWS_ACCESS_KEY_ID=******************** \
  -e AWS_SECRET_ACCESS_KEY=**************************************** \
  -e BUCKET=************ \
  -e MOUNT_DIR=/mnt/foo \
  genzouw/goofys \
    --region eu-west-1 \
    --stat-cache-ttl 1m0s \
    --type-cache-ttl 1m0s \
    --dir-mode 0700 \
    --file-mode 0500
```

## License

This software is released under the MIT License, see LICENSE.

## Help

Got a question ?

File a [Github issue](https://github.com/genzouw/goofys/issues), send an email to [genzouw@gmail.com](mailto:genzouw@gmail.com) or tweet to [@genzouw](https://twitter.com/genzouw) on Twitter.

## Author Information

[genzouw](https://genzouw.com)

* Twitter   : @genzouw ( https://twitter.com/genzouw )
* Facebook  : genzouw ( https://www.facebook.com/genzouw )
* LinkedIn  : genzouw ( https://www.linkedin.com/in/genzouw/ )
* Gmail     : genzouw@gmail.com
