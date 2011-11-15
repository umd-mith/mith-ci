#!/bin/sh

if [ "`md5sum ../jobs/*/config.xml`" = "`cat jobs-config.md5.txt`" ]; then
  echo "No changes to job configuration files."
else
  echo "Creating updated templates for job configuration files."
  for file in ../jobs/*/config.xml
  do
    sed "s/<authToken>[^<]*</<authToken><\!-- Insert token here. --></g" $file | sed "s/<password>[^<]*</<password><\!-- Insert password here. --></g" > $file.template
  done
  md5sum ../jobs/*/config.xml > jobs-config.md5.txt
fi

