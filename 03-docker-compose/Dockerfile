FROM ruby:2.5.3

WORKDIR /app

# install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# copy source code
COPY . .

CMD ["bundle", "exec", "ruby", "app.rb"]
