# Pick the ruby version for your rails app
FROM ruby:3.0.1

# Installing some needed things here
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev tzdata libicu-dev

# for nokogiri
RUN apt-get install -yqq libxml2-dev libxslt1-dev

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Make the directory for the app
RUN mkdir /app

# Set the working directory of everything to the directory we just made.
WORKDIR /app

# Gems
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

# Install and run bundle to get the app ready
RUN gem install bundler
RUN bundle install

# Copy the Rails application into place
COPY . /app
