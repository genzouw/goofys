## Usage

### When the mount directory is not specified

Using the "BUCKET" environment variable, mount on the "/mnt/${BUCKET}" directory.

```bash
docker \
  run -d --privileged \
  -e AWS_ACCESS_KEY_ID=******************** \
  -e AWS_SECRET_ACCESS_KEY=**************************************** \
  -e BUCKET=************ \
  genzouw/goofys
```

### When the mount directory is specified

Using the "MOUNT_DIR" environment variable, mount on the "${MOUNT_DIR}" directory.

```bash
docker \
  run -d --privileged \
  -e AWS_ACCESS_KEY_ID=******************** \
  -e AWS_SECRET_ACCESS_KEY=**************************************** \
  -e BUCKET=************ \
  -e MOUNT_DIR=/mnt/foo \
  genzouw/goofys
```
