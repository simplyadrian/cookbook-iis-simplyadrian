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



# Install all ARR dependencies and ARR application
node['iis-nativex']['arr_application'].each do |win_pkg|
  win_pkg windows_package [:package_name] do
    source win_pkg[:source]
    installer_type win_pkg[:installer_type]
    checksum win_pkg[:checksum]
    options win_pkg[:options]
    timeout win_pkg[:timeout]
    version win_pkg[:version]
    action :install
  end
end
