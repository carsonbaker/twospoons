FROM ruby:2.4.3-alpine

ENV BUILD_PACKAGES ruby-rake build-base libxml2-dev libxslt-dev git zlib-dev libffi-dev postgresql-dev nodejs tzdata

# Update and install all of the required packages.
# At the end, remove the apk cache
RUN apk update && \
    apk upgrade && \
    apk add $BUILD_PACKAGES && \
    rm -rf /var/cache/apk/*

# Add a user named 'rails' with no assigned password
RUN     adduser -D -g "" ruby

# Configure the main working directory. This is the base
# directory used in any further RUN, COPY, and ENTRYPOINT
# commands.
RUN       mkdir /app
RUN       chown ruby:ruby /app
RUN       mkdir -p /sockets && chmod 777 /sockets && chmod u+s /sockets

VOLUME    /sockets

# Copy the Gemfile as well as the Gemfile.lock and install
# the RubyGems. This is a separate step so the dependencies
# will be cached unless changes to one of those two files
# are made.
USER       ruby
WORKDIR    /app
COPY       --chown=ruby:ruby Gemfile Gemfile.lock ./

# throw errors if Gemfile has been modified since Gemfile.lock
# ENV        BUNDLE_APP_CONFIG "/app/.bundle"
# RUN        bundle config --global frozen 1
RUN        bundle install --jobs 20 --retry 5

# do we add --deployment on the end of bundle install?

# Copy the main application.
COPY       --chown=ruby:ruby . ./

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
