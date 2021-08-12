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
prime-select on-demand					#intel mode means the GPU isn't used. Nvidia mode means the laptop will be noisy and drain the battery very quickly. On-demand is a nice (but not ideal) middle of the road solution. Take your complaints to nvidia. This whole thing would not be a problem if their drivers were open-source or they properly supported linux.
echo "__NV_PRIME_RENDER_OFFLOAD=1" >> /etc/environment	#This and the next line are required to make sure the computer uses the GPU for OpenGL and Vulkan applications while the remainder will be done by the CPU.
echo "__GLX_VENDOR_LIBRARY_NAME=nvidia" >> /etc/environment
echo "Everything should be done now. Changes take effect after a reboot."
