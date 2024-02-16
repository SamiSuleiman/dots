#! /bin/zsh

# add url to `urls` with tag
url=$1
tag=$2
echo "$url \"$tag\"" >> ./urls

# export to opml2 (with tage)
newsboat --export-to-opml2 > urls.opml
