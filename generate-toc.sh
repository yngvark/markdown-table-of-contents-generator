#!/usr/bin/env bash
set +ex
DOCKER_IMAGE=markdown-toc-generator-and-replacer

# Get image for generating TOC if not exists
if [[ `docker images | grep $DOCKER_IMAGE | wc -l` != 1 ]]; then
    git clone https://github.com/ekalinin/github-markdown-toc || true
    docker build -t $DOCKER_IMAGE github-markdown-toc
fi

A=`docker run -v $(pwd):/data $DOCKER_IMAGE /data/README.md`
echo A IS:
echo $A

# Cleanup
rm -rf github-markdown-toc

# Update README.md TOC
#perl -0777 -i.original -pe 's/Table[\s\S]*\/github-markdown-toc\)/hoi/' README.md
