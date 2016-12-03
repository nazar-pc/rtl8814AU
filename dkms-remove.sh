#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "You must run this with superuser priviliges.  Try \"sudo ./install.sh\"" 2>&1
  exit 1
else
  echo "About to run dkms removal steps..."
fi

DRV_NAME=rtl8814AU
DRV_VERSION=4.3.21

RESULT=$(dkms remove ${DRV_NAME}/${DRV_VERSION} --all)
if [[ $RESULT -ne 0 ]]; then
  echo "Error occurred while running dkms remove." 2>&1
else
  echo "Running make uninstall..."
  RESULT=$(make uninstall)
fi

echo "Finished running dkms removal steps."

exit $RESULT
