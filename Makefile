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

lint_bot:
	docker-compose run --rm app bash -c "bundle exec rubocop"

fix_lint_bot:
	docker-compose run --rm app bash -c "bundle exec rubocop --auto-correct"

set_webhook:
	docker-compose run --rm app bash -c "bin/rake telegram:bot:set_webhook RAILS_ENV=development"

compose-setup:
	cp -n .env.example .env || true
	make build_bot
	docker-compose run --rm app bash -c "bin/setup"

.PHONY: test

