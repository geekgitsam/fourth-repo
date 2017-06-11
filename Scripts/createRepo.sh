#!/usr/bin/sh

repo_name=$1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u "geekgitsam:gittysam@555" -d "{\"name\":\"$repo_name\"}" https://api.github.com/user/repos
#curl https://api.github.com/repos/geekgitsam/second-repo

if [ $? -eq 0 ]
then
        echo "OK"
	cd ~/gittest/repos
	mkdir $repo_name
	cd $repo_name
	pwd

	echo "This is a new repo" > README.md	

	git init
	git add README.md
	git commit  -m "creating new repo"
	git remote add origin "https://github.com/geekgitsam/$repo_name.git"
	git push -u origin master
else
        echo "ERROR: cannot create repo $repo_name"
fi
