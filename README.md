``` bash
docker build -t hgweb-demo:latest .

docker run --rm -it hgweb-demo:latest /bin/bash

docker run --rm -it hgweb-demo:latest /hgweb/clone-test.sh

docker run --rm -it hgweb-demo:latest /hgweb/lfpull-test.sh
```
