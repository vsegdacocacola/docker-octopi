# docker-octopi

## Notes: 

1. Build and launch octopi container
```
docker build -t octoprint .
docker run -p 5000:5000 --name octoprint --restart=always -d --device=/dev/ttyACM0 -it octoprint
```