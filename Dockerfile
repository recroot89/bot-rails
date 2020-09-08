FROM ruby:2.7.1

ARG RAILS_ROOT=/bot_rails

RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

RUN gem install bundler:2.1.4

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 5

ADD . $RAILS_ROOT

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
