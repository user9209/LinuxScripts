find . -type d ! -type f -print0 | xargs -0 chmod 755
find . -type f ! -type d -print0 | xargs -0 chmod 644
find . -type f ! -type d -name '*.sh' -print0 | xargs -0 chmod 755
