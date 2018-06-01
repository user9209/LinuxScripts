# How to backup all your GitHub-Repos? #

1) Login in https://github.com/

2) call https://api.github.com/users/<username>/repos

3) Download (2) as plain text file

4) Run this regex in notepad++, java or egrep ( without | )  
    - |^(?! +"ssh_url":).+$| -> ||       // all lines not containing "ssh_url"  
	- |(^\s*$\r?\n|\r?\n\s*$)|  -> ||    // all empty lines  
	- | +"ssh_url": "(.+)".+| -> |$1|      // cut value of "ssh_url"  
	
5) Result to "repo.list"

6) Call "GitClone.cmd"

7) To update call "GitUpdateMirror.cmd"

8) ZIP Data, encrypt and upload to cloud ;-)