#!/bin/bash

#    Copyright (C) 2018  Georg Schmidt <gs-develop@gs-sys.de>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.


if [ "$1" == "" ] || [ "$2" == "" ] || [ "$3" != "" ] 
then
   echo -e "<script>.sh <name-file> <key-id>\n"
   exit 1
fi

if [ ! -d /tmp/gpg_export ]
then
  mkdir /tmp/gpg_export
fi

name=$1
id=$2

gpg --export-secret-key -a $id > /tmp/gpg_export/$name-priv.asc
gpg --export -a $id > /tmp/gpg_export/$name-pub.asc
