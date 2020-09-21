build_bot:
	docker-compose build

bash_bot:
	docker-compose run --rm app bash

start_bot:
	docker-compose up

stop_bot:
	docker-compose down

test_bot:
	docker-compose run --rm app bash -c "bundle exec rspec"
	# docker-compose run --rm app bash -c "bin/rails test -d"

app-prepare:
	docker-compose run --rm app bash -c "bundle install"

db-prepare:
	docker-compose run --rm app bash -c "bin/rails db:create db:migrate db:seed"

.PHONY: test

