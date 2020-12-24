# TKEStack Documentation

## Install gitbook cli
````bash
npm install -g gitbook-cli
````

## edit with gitbook
````bash
git checkout master
````

## build book
````bash
gitbook install && gitbook build

## publish book
````bash
git checkout gh-pages
mv _book/* .
git add -A
git commit -a -m "Publish book"
````
