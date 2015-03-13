#
# Cookbook Name:: iis-nativex
# Recipe:: add-windows-features
#
# Copyright 2015, NativeX
#
# All rights reserved - Do Not Redistribute
#

#TODO figure out how to install the ARR feature without the webpl installer.

#1. Stop IIS first by typing net stop was /y and net stop wmsvc /y on an elevated command-line window

#*** note that WMSVC is the IIS Web Management Service, which might not be enabled on your server. In such a case, trying to stop it will result with The Web Management Service service is not started. This is not unusual and should not be cause for alarm.

#2. Download and install the Web Farm Framework module. It is currently available in version 1.1

#3. Download and install the External cache module. It is currently available in version 1.0

#4. Download and install the URL Rewrite module. It is currently available in version 2.0 

#5. Download and install ARR itself. It is currently available in version 3.0

#6. Start the IIS services back (or, simply reboot your server) and you should be good to go!