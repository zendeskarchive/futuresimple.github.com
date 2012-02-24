# Future Simple Lab Blog

This is the repo for the Future Simple Lab blog.

### How to work with this

Check out this repo and make sure you have 2 branches - master and development.

master has the compiled version, development has the source code. These 2 are completely different, do not attempt to merge them.

When working, you can have a working server which recompiles the files you work on by running:

```
make watch
```

When you're done, call the following command to copy the compiled site to master and push it to github

```
make release
```

### Github

There is a github widget, which reads in github data stored in data/github.json

To update this data, run:

```
rake github
```

This will fetch all public info and update the data/github.json file
