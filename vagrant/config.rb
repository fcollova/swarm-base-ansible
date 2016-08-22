# Size of the CoreOS cluster created by Vagrant
# Number of masters
$master_instances=1
# Number of minions
$minion_instances=4

# To automatically replace the discovery token on 'vagrant up', uncomment
# the lines below:
#
#if File.exists?('user-data') && ARGV[0].eql?('up')
#  require 'open-uri'
#  require 'yaml'
#
#  token = open($new_discovery_url).read
#
#  data = YAML.load(IO.readlines('user-data')[1..-1].join)
#  if data['coreos'].key? 'etcd'
#    data['coreos']['etcd']['discovery'] = token
#  end
#  if data['coreos'].key? 'etcd2'
#    data['coreos']['etcd2']['discovery'] = token
#  end
#
#  yaml = YAML.dump(data)
#  File.open('user-data', 'w') { |file| file.write("#cloud-config\n\n#{yaml}") }
#end
#


# Change basename of the VM
$instance_name_prefix="dev"


# Enable port forwarding of Docker TCP socket
# Set to the TCP port you want exposed on the *host* machine, default is 2375
# If 2375 is used, Vagrant will auto-increment (e.g. in the case of $num_instances > 1)
# You can then use the docker tool locally by setting the following env var:
#   export DOCKER_HOST='tcp://127.0.0.1:2375'
$expose_docker_tcp=2375

# Enable NFS sharing of your home directory ($HOME)
# It will be mounted at the same path in the VM as on the host.
# Example: /Users/foobar -> /Users/foobar
#$share_home=false

# Customize VMs
#$vm_gui = false
$vm_master_memory = 1024
$vm_master_cpus = 2
$vm_minion_memory = 1024
$vm_minion_cpus = 2

# Share additional folders to the VMs
# For example,
# $shared_folders = {'/path/on/host' => '/path/on/guest', '/home/foo/app' => '/app'}
# or, to map host folders to guest folders of the same name,
# $shared_folders = Hash[*['/home/foo/app1', '/home/foo/app2'].map{|d| [d, d]}.flatten]
$shared_folders = {'../apps' => '/apps'}

# Enable port forwarding from guest(s) to host machine, syntax is: { 80 => 8080 }, auto correction is enabled by default.
#$forwarded_ports = {}

# Ansible provision settings
# Provision playbook location
$ansible_playbook='ansible/all.yml'
# Inventory path - will be written from vagrantfile
$ansible_inventory='ansible/inventory/vagrant'

# IP range
$ip_range='192.168.51.'
# IP start from
$ip_start=50
