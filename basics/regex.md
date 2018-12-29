RegEx
-----

sed

Special chars: /
Group:  \X

s/https:\/\/([^/]+)\/(.+)/git@\1:\2.git/p



# regex
s/text([0-9]+)/\1/p

# sample
test1234 -> 1234



Notepad++ or Java

Special chars: $
Group:  $X

# Search:
https://(.+)/(.+)

# Replace
git@$1:$2.git

