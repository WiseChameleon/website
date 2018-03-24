export JEKYLL_VERSION=3.5

DEFAULTS="--volume="$PWD/data:/srv/jekyll" \
  		  --volume="$PWD/data/vendor/bundle:/usr/local/bundle" \
          -it jekyll/jekyll:$JEKYLL_VERSION"

rm -rf $PWD/data/_site

docker run --rm -d -p 4000:4000 $DEFAULTS jekyll serve