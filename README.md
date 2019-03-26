# img-tool

Utilities for execute commands (amd64 &amp; armhf) &amp; resize the file-images.

## API v0.4

### Build image

```bash
cd repo-w-instructions
docker run --privileged -it --rm -v /dev:/dev -v $(pwd):/builder/repo goldarte/img-tool:v0.4
```

> * Directory `repo-w-instructions` must consist folder `builder` with the script `image-build.sh`. This script will executed in docker-container.
> * Source image may be placed to `./images/`. And final image should be placed by same way (path in docker `/builder/repo/images`).
> * Also you can to transfer variable to docker-image: use `-e NAME="VALUE"`

### Execute in image

```bash
cd folder-w-images-dir
docker run --privileged -it --rm -v /dev:/dev -v $(pwd):/builder/repo goldarte/img-tool:v0.4 /builder/image-chroot.sh <IMAGE> [ exec <SCRIPT> [...] | copy <MOVE_FILE> <MOVE_TO> ]
```

### Resize image

```bash
cd folder-w-images-dir
docker run --privileged -it --rm -v /dev:/dev -v $(pwd):/builder/repo goldarte/img-tool:v0.4 /builder/image-resize.sh <IMAGE> [ min <FREE_SPACE> | max <FREE_SPACE> ]
```

## License

Copyright 2019 Arthur Golubtsov, Alexey Rogachevskiy, Oleg Kalachev, Artem Smirnov

Licensed under the Apache License, Version 2.0
