#!/bin/bash
#This program requires root level access as it will install drivers, configure the driver settigns and add enviroment values.
if [[ $(id -u) -ne 0 ]];
  then echo "This installer needs to run as root. Rerun using sudo."
  exit
fi
version=$(lsb_release -d | awk "{print $2}" | cut -f2 -d" " | cut -f1,2 -d".")
if [[ $version != "20.04" ]];
  then echo "I wrote this for Ubuntu version 20.04. Your computer seems to run something else."
  read -p "Would you still like to continue? (y/n) " ans
  echo $ans
  if [[ $ans == "n" ]];
    then exit
  fi
fi

apt update						#updating packages
apt install nvidia-driver-470 -y			#Currently the most current version of the nvidia driver in the repos. If a newer version is available please send a pull request.
echo "Driver is installed. Reboot the system and run part2.sh."
