# Install k3s with ansible

You can now connect and power up your rPi to the switch, after booting up your IP and hostname will be visible in the DHCP leases list on the TV.

This part requires the ssh user/password to be `pi:password`. If this is not the case, you need to change the inventory file to another username/password combination.

## Task 1

Now that your rPis are up and running, they should be accessible over SSH. Which means that we can provision them remotely with Ansible.

Ansible is run from your development machine, where your local machine SSH into the remote hosts and perform tasks that we define in ansible-playbooks.

Before we run our ansible playbooks, we need to define a inventory file containing the remote targets that we should run the playbooks on.

This workshop contains a example in this part's `ansible-rpi-k3s/inventory/workshop-demo/hosts.ini` file.

Here we define our k3s master node, and our k3s worker nodes.

- Download Ansible on your development machine.
- Change the IP addresses in `ansible-rpi-k3s/inventory/workshop-demo/hosts.ini` to the IP addresses for your hostnames.
- Run the followig command in `amsible-rpi-k3s/` directory
  - ```ansible-playbook site.yml -i inventory/workshop-demo/hosts.ini```

If all went well, your rPis should now be provisioned with K3s. You can continue to part 3 of the workshop.
