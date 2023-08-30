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

# docker-compose up -d
# docker-compose run rails rails db:create
# docker run -p 3000:3000 rails_docker:1





