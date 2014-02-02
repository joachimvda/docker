docker
======

Collection of dockerfiles


How to build (as root)
```bash
cd base/baremetal
docker build -rm -t joachimvda/base/baremetal . 
```


Run an instance:
```bash
docker run -d -p 1022:22 joachimvda/base/ssh
```


Attach console:
```bash
sudo docker attach -sig-proxy=false $CONTAINER_ID
```

