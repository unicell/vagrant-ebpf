echo "deb http://apt.llvm.org/bionic/ llvm-toolchain-bionic-7 main" | sudo tee -a /etc/apt/sources.list
echo "deb-src http://archive.ubuntu.com/ubuntu/ bionic main restricted" | sudo tee -a /etc/apt/sources.list

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4052245BD4284CDD
echo "deb https://repo.iovisor.org/apt/$(lsb_release -cs) $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/iovisor.list

sudo apt-get update

sudo apt-get -y build-dep linux-image-$(uname -r)
sudo apt-get install -qy vim git tig

# for kernel and ebpf in general
sudo apt-get install -qy libelf-dev libcap-dev flex bison
sudo apt-get install -qy clang llvm gcc-multilib linux-tools-$(uname -r) linux-headers-$(uname -r)
sudo apt-get install -qy clang-7 llvm-7

# for bpftool
sudo apt-get install -y binutils-dev binutils-multiarch-dev libiberty-dev

# for cloudflare/bpftools
sudo apt-get install -y libreadline-dev
#virtualenv venv
#source ./venv/bin/activate
#pip install pcappy

# /usr/share/bcc/tools, /usr/share/bcc/examples
sudo apt-get install -y bcc-tools libbcc-examples linux-headers-$(uname -r)
