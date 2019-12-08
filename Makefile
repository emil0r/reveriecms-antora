#!/usr/bin/make -sf

default: build-site

deploy-site:
	git subtree push --prefix build/site origin gh-pages
	@echo "Deployed the site"

build-site:
	antora generate playbook.prod.yml
	@echo "Built docs.reveriecms.com with prod playbook"

add-cname:
	mkdir -p build/site
	echo docs.reveriecms.com > build/site/CNAME

rm-site:
	rm -rf build
	@echo "Removed build"
