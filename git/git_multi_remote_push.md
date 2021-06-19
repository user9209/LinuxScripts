# git-multi-remote-push

see: https://stackoverflow.com/questions/5785549/able-to-push-to-all-git-remotes-with-the-one-command

````
[remote "all"]
    url = git@bitbucket.org:.../project.git
    url = git@github.com:.../project.git
````

Use:

````
git push all --all
````
