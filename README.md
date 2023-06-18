# docker-ros2-xarm

A minimal docker image for ros2+xarm

## Build

### arm64 (e.g., Mac with Apple silicon)

```bash
docker build -t ros2-xarm -f Dockerfile.arm64 .
```

### amd64

```bash
docker build -t ros2-xarm -f Dockerfile.amd64 .
```
