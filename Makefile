.PHONY: deploy deploy-api deploy-static setup

setup:
	git remote add gh git@github.com:geeio/geeio.github.io.git

deploy-api:
	jitsu deploy -c
	rm lib/server.js

deploy-static:
	harp compile
	git add www
	git commit -am 'Release'
	git push gh `git subtree split --prefix www master`:master --force

icons:
	grep -RhEo 'ion-[a-zA-Z\-]*' public/ | sort | uniq

deploy: deploy-api deploy-static
