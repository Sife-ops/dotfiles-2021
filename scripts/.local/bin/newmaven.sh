#!/bin/sh

mvn archetype:generate \
    -DgroupId=dev.wyatt \
    -DartifactId=$1 || exit 1

sed -e '/<maven.compiler.source>/ s/1\.7/1\.8/' \
    -e '/<maven.compiler.target>/ s/1\.7/1\.8/' \
    -i $1/pom.xml || exit 1

cd $1 && code ./
