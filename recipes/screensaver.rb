osx_defaults "set screensaver timeout" do
  domain 'com.apple.screensaver'
  key 'idleTime'
  integer 0
end

execute "set display, disk and computer sleep times" do
  command "pmset -a displaysleep 0 disksleep 0 sleep 0"
end
