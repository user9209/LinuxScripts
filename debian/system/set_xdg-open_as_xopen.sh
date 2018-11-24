#!/bin/bash
if [ ! -f /bin/xopen ] ; then
  ln -s /usr/bin/xdg-open /bin/xopen
fi
