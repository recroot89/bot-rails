build:
	docker-compose build

bash:
	docker-compose run --rm app bash

start:
	docker-compose up

stop:
	docker-compose down

test:
	docker-compose run --rm app bundle exec rspec

lint:
	docker-compose run --rm app bundle exec rubocop

fix:
	docker-compose run --rm app bundle exec rubocop --auto-correct

set-webhook:
	docker-compose run --rm app bin/rake telegram:bot:set_webhook RAILS_ENV=development

compose-setup:
	cp -n .env.example .env || true
	make build
	docker-compose run --rm app bin/setup

ci-test:
	cp -n .env.example .env || true
	make stop
	make compose-setup
	make lint
	make test

.PHONY: test

