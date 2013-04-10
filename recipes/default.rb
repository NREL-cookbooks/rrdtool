case node['platform_family']

  when "debian"
  when "rhel","fedora"
    # need to install from rpm

      package "gettext" do
        action :install
      end

      package "perl-Time-HiRes" do
        action :install
      end

      package "pango" do
        action :install
      end

      package "cairo" do
        action :install
      end

      remote_file "#{Chef::Config[:file_cache_path]}/rrdtool-perl-1.4.7-1.el6.wrl.x86_64.rpm" do
        source "http://packages.express.org/rrdtool/rrdtool-perl-1.4.7-1.el6.wrl.x86_64.rpm"
        mode 00755
      end

      remote_file "#{Chef::Config[:file_cache_path]}/rrdtool-1.4.7-1.el6.wrl.x86_64.rpm" do
        source "http://packages.express.org/rrdtool/rrdtool-1.4.7-1.el6.wrl.x86_64.rpm"
        mode 00755
      end

      remote_file "#{Chef::Config[:file_cache_path]}/rrdtool-devel-1.4.7-1.el6.wrl.x86_64.rpm" do
        source "http://packages.express.org/rrdtool/rrdtool-devel-1.4.7-1.el6.wrl.x86_64.rpm"
        mode 00755
      end

      bash "install via rpm" do
        cwd Chef::Config[:file_cache_path]
        code <<-EOH
          rpm -ivh rrdtool-perl-1.4.7-1.el6.wrl.x86_64.rpm rrdtool-1.4.7-1.el6.wrl.x86_64.rpm rrdtool-devel-1.4.7-1.el6.wrl.x86_64.rpm
        EOH

        not_if { ::File.exists?("/usr/bin/rrdtool") }
      end
  when "windows"
  when "mac_os_x"
  else

end
