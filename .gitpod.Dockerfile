FROM gitpod/workspace-full

# Install QEMU
RUN sudo apt-get update -q && \
    sudo apt-get install -y sudo curl wget qemu-kvm qemu-system-x86 unzip util-linux && \
    sudo apt-get clean && \
    sudo rm -rf /var/lib/apt/lists/*

# Add the script to the Docker image
COPY file.sh /usr/local/bin/setup_windows_vm.sh
RUN chmod +x /usr/local/bin/setup_windows_vm.sh

# Set the entrypoint to run the script
ENTRYPOINT ["/usr/local/bin/setup_windows_vm.sh"]

