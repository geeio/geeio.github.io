.PHONY: deploy

deploy:
	bundle exec sass style/main.sass public/style.css
	harp compile
	bundle exec s3_website push --site www
