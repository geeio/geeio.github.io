.PHONY: deploy deploy-api

deploy-api:
	jitsu deploy -c
	rm lib/server.js

setup:
	git remote add gh git@github.com:geeio/geeio.github.io.git

deploy:
	harp compile
	git add www
	git commit -am 'Release'
	git push gh `git subtree split --prefix www master`:master --force

