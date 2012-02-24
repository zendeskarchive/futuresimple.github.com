# Future Simple Lab Blog

This is the repo for the Future Simple Lab blog.

In order to compile the site, run:

```
make
```

When working, you can have a working server which recompiles the files you work on by running:

```
make watch
```


### Github

There is a github widget, which reads in github data stored in data/github.json

To update this data, run:

```
rake github
```

This will fetch all public info and update the data/github.json file
