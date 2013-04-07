case node['platform_family']

  when "debian"
  when "rhel","fedora"
    package "rrdtool" do
      action :install
    end
  when "windows"
  when "mac_os_x"
  else

end
