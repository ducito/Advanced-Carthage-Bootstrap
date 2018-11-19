#!/bin/sh
# "-------------------------------------------------------"
# " Advanced Carthage bootstrap 1.0.1                     "
# " Created on Nov 19, 2018                               "
# " Copyright (c) Duc Nguyen                              "
# "-------------------------------------------------------"

echo "-------------------------------------------------------"
echo " Advanced Carthage bootstrap 1.0.1                     "
echo " Created on Nov 19, 2018                               "
echo " Copyright (c) Duc Nguyen                              "
echo "-------------------------------------------------------"

CARTFILE="Cartfile.resolved"
CACHED_CARTFILE="Carthage/Cartfile.resolved"

if [ -e "$CACHED_CARTFILE" ]
then
   originalFileHashed=`md5 Cartfile.resolved`
   if [ -e "$CACHED_CARTFILE" ]
   then
     backupFileHashed=`md5 Carthage/Cartfile.resolved`
     if [ "$originalFileHashed" = "$backupFileHashed" ]
     then # OUTDATED_DEPENDENCIES
       echo "Bootstrapping outdated dependencies..."
       carthage bootstrap --platform iOS --no-use-binaries
       cp Cartfile.resolved Carthage
     else
       echo "Cartfile.resolved matches cached, skipping bootstrap."
     fi
   else
     echo "Cached Cartfile.resolved not found, bootstrapping all dependencies..."
     carthage bootstrap --platform iOS --no-use-binaries
     cp Cartfile.resolved Carthage
   fi
else
  echo "Cartfile.resolved not found! Updating all dependencies..."
  carthage bootstrap --platform iOS --no-use-binaries
  cp Cartfile.resolved Carthage
fi
