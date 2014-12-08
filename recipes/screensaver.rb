plist_dir = "#{node['sprout']['home']}/Library/Preferences/ByHost"
domains = Dir["#{plist_dir}/com.apple.screensaver.*.plist"].map do |f| 
  domain = File.basename(f).chomp('.plist')
  "ByHost/#{domain}"
end
domains.each do |domain|
  osx_defaults "set screensaver timeout" do
    domain domain
    key 'idleTime'
    integer 0
  end
end

execute "set display, disk and computer sleep times" do
  command "pmset -a displaysleep 0 disksleep 0 sleep 0"
end
