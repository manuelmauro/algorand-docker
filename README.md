# Docker Image for an Algorand Node

You can build an image by running this command

```bash
docker build -t algorand:<tag> .
```

and run a container with this

```bash
docker run --mount source=data,target=/node/data algo:<tag>
```
