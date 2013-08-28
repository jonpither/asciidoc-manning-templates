#!/bin/bash

echo $BOOK_HOME

MAKEPDF_HOME=$BOOK_HOME/AuthorInfo/AAMakePDF/
TEMPLATES_HOME=$BOOK_HOME/asciidoc-manning-templates

asciidoctor -T $TEMPLATES_HOME -a chapterFilename=$1 -b docbook45 -o $BOOK_HOME/manuscript/$1.xml $1.txt
awk -f $TEMPLATES_HOME/scripts/cofix.awk $BOOK_HOME/manuscript/$1.xml > $BOOK_HOME/manuscript/$1.fixed
mv $BOOK_HOME/manuscript/$1.fixed $BOOK_HOME/manuscript/$1.xml
