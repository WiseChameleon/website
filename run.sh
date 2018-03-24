#!/usr/bin/env bash

export JEKYLL_VERSION=3.5

DEFAULTS="--rm \
	  --volume="$PWD/data:/srv/jekyll" \
  	  --volume="$PWD/data/vendor/bundle:/usr/local/bundle" \
          -it jekyll/jekyll:$JEKYLL_VERSION"

rm -rf $PWD/data/_site

if [ "$CONTINUOUS_INTEGRATION" = "true" ]; 
	then docker run -it $DEFAULTS jekyll build; # Just build on Travis; -it is needed 
else
	docker run -p 4000:4000 $DEFAULTS jekyll serve; # Serve content for local dev
fi
