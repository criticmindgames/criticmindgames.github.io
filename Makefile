HUGO_URI := -tags extended,withdeploy github.com/gohugoio/hugo@v0.150
HUGO_RUN := CGO_ENABLED=1 go run $(HUGO_URI)

.GODEPS:
	CGO_ENABLED=1 go install $(HUGO_URI)

.PHONY: build
build: ## Build application
	$(HUGO_RUN) --minify
	echo "criticmind.games" > public/CNAME

.PHONY: run
run: ## Run application
	$(HUGO_RUN) server

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
