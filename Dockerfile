FROM ruby:3.1.4
RUN apt-get update -qq && apt-get install -y vim

RUN mkdir /suumo-scraping
WORKDIR /suumo-scraping
COPY Gemfile /suumo-scraping/Gemfile
COPY Gemfile.lock /suumo-scraping/Gemfile.lock

RUN gem update --system
RUN bundle update --bundler

RUN bundle install
COPY . /suumo-scraping

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]