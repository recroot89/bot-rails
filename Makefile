build:
	docker-compose build

bash:
	docker-compose run --rm app bash

start:
	docker-compose up

stop:
	docker-compose down

test:
	docker-compose run --rm app bash -c "bundle exec rspec"

lint:
	docker-compose run --rm app bash -c "bundle exec rubocop"

fix:
	docker-compose run --rm app bash -c "bundle exec rubocop --auto-correct"

set_webhook:
	docker-compose run --rm app bash -c "bin/rake telegram:bot:set_webhook RAILS_ENV=development"

compose-setup:
	cp -n .env.example .env || true
	make build_bot
	docker-compose run --rm app bash -c "bin/setup"

.PHONY: test

