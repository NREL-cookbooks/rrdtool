case node['platform_family']

  when "debian"
  when "rhel","fedora"
    package "rrdtool-devel" do
      action :install
    end
  when "windows"
  when "mac_os_x"
  else

end
