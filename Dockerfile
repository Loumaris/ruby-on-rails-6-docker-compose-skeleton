FROM ruby:2.7.1
LABEL maintainer="cheimke@loumaris.com"

ENV RAILS_ENV production

WORKDIR /app

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt-get install -y yarn

COPY Gemfile* /app/

RUN bundle install --jobs 20 && \
    yarn install

COPY . /app

RUN apt purge -y build-essential git && \
    apt-get autoremove -y

RUN rails assets:precompile

CMD [ "rails", "loumaris:start" ]
