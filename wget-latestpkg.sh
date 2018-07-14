#!/bin/sh

repo=$1
user=$2
password=$3
groupId=$4
artifactId=$5
version=$6

# optional
classifier=$7
type=$8

if [[ $type == "" ]]; then
  type="jar"
fi
if [[ $classifier != "" ]]; then
  classifier="-${classifier}"
fi

groupIdUrl="${groupId//.//}"
filename="${artifactId}-${version}${classifier}.${type}"

if [[ ${version} == *"SNAPSHOT"* ]]; then repo_type="snapshots"; else repo_type="releases"; fi

if [[ $repo_type == "releases" ]]
 then
   wget --no-check-certificate "${repo}/repository/releases/${groupIdUrl}/${artifactId}/${version}/${artifactId}-${version}${classifier}.${type}" -O ${filename} -k
 else
   versionTimestamped=$(wget --user=$user --password=$password -q -O- --no-check-certificate "${repo}/repository/maven-snapshots/${groupIdUrl}/${artifactId}/${version}/maven-metadata.xml" | grep -m 1 \<value\> | sed -e 's/<value>\(.*\)<\/value>/\1/' | sed -e 's/ //g')

   wget --user=$user --password=$password --no-check-certificate "${repo}/repository/maven-snapshots/${groupIdUrl}/${artifactId}/${version}/${artifactId}-${versionTimestamped}${classifier}.${type}" -O ${filename}
 fi