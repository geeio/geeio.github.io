.PHONY: deploy

deploy:
	sass style/main.sass public/style.css
	harp compile
	s3_website push --site www
