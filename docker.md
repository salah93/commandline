
# Docker - what I've learned

[source](https://prakhar.me/docker-curriculum/)

Recently, I've been focusing a part of my time to learning docker, a technology of growing importance in the software engineering sphere. I'm also studying for the GRE, and so will include 10 new words I've learned in this blog post :).



## What is docker
From what I understand, docker offers a solution for deploying applications in the same environment regardless of machine or host setup. This contained environment is called a, wait for it, "container". They are created off images, similar to what digitalocean refers to as snapshot. You can pull images off a repository or create your own with a simple file called `Dockerfile`. The dockerfile gives the base image the steps it needs to recreate your application environment. It is fast and easy, but for multi process applications (think redis+flask), you would need a container for each process and have the containers communicate with one another via a shared network called "bridge". This network is shared among all containers, and is different from the host's network. You have the option of creating your own network and having containers use that, more isolated, network.

To recap,
- docker creates images based off dockerfiles
- "containers" are created with images
- images can be pulled from a repository ([dockerhub](https://hub.docker.com))
- docker containers share a network, different from the host's network

## [Dockerfile](https://docs.docker.com/engine/reference/builder/)
A dockerfile contains a series of commands you give docker to create your image. The important commands are
+ FROM
+ RUN
+ CMD
+ ENTRYPOINT
+ ADD
+ EXPOSE

Once you have a dockerfile in a dedicated directory, then if you are in said directory you can build the image with the command
```bash
$ sudo docker build .
```

If you want to give your image a name
```bash
$ sudo docker -build supercoolApp .
```

### FROM
`FROM` tells docker the base image to load the current image from, and so if you want to start with a fedora image you'd write `FROM fedora`. Search for other images [here](https://hub.docker.com)


### RUN
run gives docker a shell command to run, an example of which would be to install a dependency. This command would need to run inorder to build the image.

```bash
RUN ["dnf", "install", "curl"]
```

### CMD
cmd gives docker a default command to run when running the _container_, which is different from building the image. So, after image is built should you choose to run container of image with no arguments, then CMD will run its value. There can only by one cmd per image. If arguments are added then CMD is ignored

example:

```bash
$ cat <<EOF > Dockerfile
FROM fedora
CMD ["echo", "hello", "dude"]
EOF
$ sudo docker build -t hello-dude '.'
$ sudo docker run -d hello-dude
hello dude
```

### ENTRYPOINT
ENTRYPOINT is similar to cmd except that it still runs even if arguments are added.

example:

```bash
$ cat <<EOF > Dockerfile
FROM fedora
ENTRYPOINT ["echo", "hello"]
CMD ["dude"]
EOF
$ sudo docker build -t hello-dude '.'
$ sudo docker run -d hello-dude
hello dude
$ sudo docker run -d hello-dude mannn
hello mannn
```

### ADD
add copies files from host "context" to container's environment. An example would be moving a dependency file to the container, then installing depencies from fiie.

example:

    ADD ./requirements.txt /tmp/requirements.txt
    RUN ["pip", "install", "-r" , "/tmp/requirements.txt"]


### EXPOSE
this opens a tcp port on the container's firewall. This does not make port accessible to host on runtime, for that you would have to add `-p` or `-P` flag at runtime, described below

example:

    EXPOSE 8000

## Pulling docker images from dockerhub
```
sudo docker pull fedora
```

## Running a terminal

```
sudo docker run -it ubuntu bash
```
the `-it` argument runs the terminal from the ubuntu image, which if not already pulled will first pull the image

### other arguments for run
+ -d
    - this detaches from container, allowing the container to run without leaving host machine waiting for it to exit
+ -p \$HOSTPORT:\$CONTAINERPORT
    - this maps a port provided after argument from host machine to container port
+ -P
    - this maps a port, docker chooses port
+ --name \$CONTAINERNAME
    - this gives the container a name
- --rm
    - this removes the container once it exits, cleaning up for you

### Ports
to check the mapped ports of a container
```
sudo docker port $CONTAINERNAME
```

## Listing
    sudo docker images
    sudo docker ps
    sudo docker ps -a
    sudo docker ps -q
- the first command lists available images to create containers from
- the second command lists the current containers running
- the third command lists all containers, including ones that have exited
- the fourth command lists only the ids

## Removing
```
sudo docker stop ${CONTAINERID}
sudo docker rm $CONTAINERID
sudo docker rmi ${IMAGEID}
```

- the first command stops the container with id of \$CONTAINERID
- the second command removes that same container
- the third command removes the image with id of \$IMAGEID

### Removing all
```
    sudo docker rm -f $(sudo docker ps -aq)
    sudo docker rm $(sudo docker ps -a -q -f status=exited)
```

## Networks
containers share a network different from host machine's network called "bridge"

```
sudo docker network ls
```

to create a new network

```
sudo docker network create xyz
```

to use network
```
sudo docker run --net xyz -it ubuntu
```

inspect network

```
sudo docker network inspect xyz
```

+ pulling image
+ pushing image
+ creating image
+ viewing logs

## Installing docker

Using fedora I use dnf, but you must use your os's package manager
```bash
sudo dnf install docker
docker run hello-world
```

## Using docker in linux

```bash
sudo systemctl start docker
sudo docker ps
```



## commands
    sudo docker pull prakhar1989/static-site
    sudo  docker run -d -P --name static-site prakhar1989/static-site
    sudo docker ps
    sudo docker port static-site
    sudo docker run -p 8888:80 prakhar1989/static-site
    sudo docker port static-site
    sudo docker run -p 60001:80 prakhar1989/static-site
    sudo docker ps



    sudo docker stats
    sudo docker rm $(sudo docker ps -a -q -f status=exited)

    sudo docker logs 43dcf0f0e293
    sudo docker pull jupyter/datascience-notebook
    sudo docker images
    sudo docker build -t jupy .
    sudo docker images
    sudo docker run -d -p 8888:8888 jupy
    sudo docker logs 48

Example:
```bash
mkdir flask-docker
cd flask-docker
cat <<EOF > requirements.txt
flask
EOF
cat <<EOF > app.py
from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def hello():
    return render_template('index.html')

if __name__ == '__main__':
    app.run('0.0.0.0', port=8000)
EOF
mkdir templates
cat <<EOF > templates/index.html
<h1>Hello World!</h1>
EOF
cat <<EOF > Dockerfile
FROM fedora:latest

ADD requirements.txt /tmp
RUN dnf -y update && dnf -y install python-pip
RUN pip install -r /tmp/requirements.txt

RUN mkdir app
ADD app.py app/
ADD templates app/templates

EXPOSE 8000
CMD python app/app.py
EOF
sudo docker build -t flask .
sudo docker run --name myapp --rm -p 4444:8000 flask
```

The app should be running on your server's port 4444
