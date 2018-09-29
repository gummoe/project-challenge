.PHONY: help run test setup reset

default: help

help: ## Show this help
	@echo "Project Challenge"
	@echo "======================"
	@echo
	@fgrep -h " ## " $(MAKEFILE_LIST) | fgrep -v fgrep | sed -Ee 's/([a-z.]*):[^#]*##(.*)/\1##\2/' | column -t -s "##"


run: ## Run the application locally
	rails s

test: ## Run the application test suite
	rspec

setup: ## Set up the application
	bundle install
	rake db:reset

reset: ## Reset the database
	rake db:reset
