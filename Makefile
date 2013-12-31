.PHONY: deploy

setup:
	git remote add gh git@github.com:geeio/geeio.github.io.git

deploy:
	harp compile
	git subtree push --prefix www gh master
