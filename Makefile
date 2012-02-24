all:
	@bundle exec nanoc compile
watch:
	@bundle exec nanoc autocompile
release:
	make
	git checkout master
	cp -r output/* .
	git add .
	git ci -m "Updating blog"
	git push origin master
