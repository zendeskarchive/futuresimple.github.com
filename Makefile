all:
	@bundle exec nanoc compile
watch:
	@bundle exec nanoc autocompile
release:
	make
	git checkout master
	git pull origin master
	cp -r output/* .
	git add .
	git commit -m "Updating blog"
	git push origin master
	git checkout development
