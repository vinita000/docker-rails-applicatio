# fetch the ruby image from Dockerhub
FROM ruby:3.0-bullseye as base

# Running dependencies will install the necessary dependencies to start a rails app.
RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

# create working directory inside docker
WORKDIR /docker/app

# install bundler
RUN gem install bundler

# add Gem and Gemfile in current working directory
COPY Gemfile* ./

# run bundle
RUN bundle install

# add all our code of the current directory to our docker current directory
ADD . /docker/app

# define default_port 3000 as an argument
ARG DEFAULT_PORT 3000

# Expose the port number so that this image will run on that port number.
EXPOSE ${DEFAULT_PORT}

CMD [ "bundle","exec", "puma", "config.ru"]
# CMD ["rails","server"]
# you can also write like this.

# docker build . -t rails_docker:1 # t flag use to give image name and version number.

# docker run -p 3000:3000 rails_docker:1


# Using docker-compose, we can now eliminate network creation (docker-compose automatically creates a network for containers)

# docker-compose up
# docker-compose run rails rails db:create

# docker run -p 3000:3000 rails_docker:1
#  1  ls
#     2  cd docker-rails-applicatio/
#     3  ls
#     4  docker ps
#     5  sudo docker ps
#     6  git pull origin main
#     7  pwd
#     8  sudo chown -R 501:20 /home/ubuntu/docker-rails-applicatio
#     9  ls
#    10  docker ps
#    11  sudo docker ps
#    12  sudo docker-compose up
#    13  sudo docker-compose down
#    14  sudo docker-compose up
#    15  docker images
#    16  sudo docker images
#    17  sudo  docker-compose run rails rails db:create
#    18  sudo docker-compose up
#    19  history


#  8276  cd Downloads
#  8277  ls
#  8278  cd docker-rails-applicatio
#  8279  ls
#  8280  cd rails_7_with_docker
#  8281  ls
#  8282  git status
#  8283  code .
#  8284  git status
#  8285  ls
#  8286  docker ps
#  8287  docker images
#  8288  docker build . -t rails_docker:1
#  8289  docker ps
#  8290  docker ps -a
#  8291  docker run -p 3000:3000 rails_docker:1\n
#  8292  history
#  8293  docker-compose run rails rails db:create
#  8294  docker run -p 3000:3000 rails_docker:1\n
#  8295  docker build . -t rails_docker:1
#  8296  docker run -p 3000:3000 rails_docker:1\n
#  8297  docker ps
#  8298  docker-compose run rails rails db:create
#  8299  docker-compose up -d\n
#  8300  docker-compose run rails rails db:create
#  8301  docker run -p 3000:3000 rails_docker:1\n
#  8302  ls
#  8303  rm  rails-AWS.pem
#  8304  ls
#  8305  git status
#  8306* cd .
#  8307* cd 
#  8308* cd Downloads
#  8309* ls
#  8310* cp -r rails-docker.pem /Users/apple/Downloads/docker-rails-applicatio/rails_7_with_docker\n
#  8311* ls
#  8312  git status
#  8313  git add .
#  8314  git status
#  8315  git commit -m "key added"
#  8316  git push origin main
#  8317  git push
#  8318* sudo  ssh -i "rails-docker.pem" ubuntu@ec2-3-82-56-112.compute-1.amazonaws.com
#  8319* cd ..
#  8320* cd Rails-Docker
#  8321* ls
#  8322* code .
#  8323  git status\n
#  8324  git add .
#  8325  git commit -m "added"
#  8326  git push
#  8327  git status\n
#  8328  git add docker-compose.yml
#  8329  git commit -m "added"
#  8330  git push
#  8331  git status\n
#  8332  pwd
#  8333  sudo chown -R 501:20 /Users/apple/Downloads/docker-rails-applicatio/rails_7_with_docker
#  8334  ls
#  8335  ls -l Gemfile.lock\n
#  8336  sudo chmod 664 Gemfile.lock\n
#  8337  ls
#  8338  git status\n
#  8339  git add Dockerfile
#  8340  git status\n
#  8341  git commit -m "added"
#  8342  git push
#  8343  git status\n
#  8344  git add Dockerfile
#  8345  git commit -m "revert"
#  8346  git push
#  8347* ssh -i "rails-docker.pem" ubuntu@ec2-3-82-56-112.compute-1.amazonaws.com
#  8348* sudo ssh -i "rails-docker.pem" ubuntu@ec2-3-82-56-112.compute-1.amazonaws.com





