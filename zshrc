# ------------------------------------
# Docker aliases
# ------------------------------------

##### Alias

# Execute interactive container, e.g., $dex ansible /bin/bash
alias dex="docker exec -i -t"

# Run container
alias dr="docker run"

# Run deamonized container, e.g., $drd base /bin/echo hello
alias drd="docker run -d -P"

# Run interactive container, e.g., $dri base /bin/bash
alias dri="docker run -i -t -P"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpsa="docker ps -a"

# Stop and Remove all containers
alias dsrm='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

##### Functions

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }

# Stop all containers
ds() { docker stop $(docker ps -a -q); }

# Remove all containers
drm() { docker rm $(docker ps -a -q); }

# Zsh into running container
dzsh() { docker exec -it $(docker ps -aqf "name=$1") /bin/zsh; }

# ------------------------------------
# Docker Image aliases
# ------------------------------------

# Get images
alias di="docker images"

###### Image Functions

# Remove all images
dirm() { docker rmi $(docker images -q); }
