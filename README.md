# Mini Mesos Server via Vagrant

This files should help to create with easy tests a little Apache Mesos test 
environment.

## Requirements

- Vagrant (with virtualbox)
- Git
- Ansible

## Step 1: Provisoning of mesos serversa

This will create one master and two nodes

```
git clone https://github.com/AVENTER-UG/mesos-vagrant
cd mesos-vagrant/vagrant
vagrant up
```

## Step 2: Install mesos

These step will install a whole Mesos stack. The ansible inventory files
you fill find in the inventory directory of mesos-vagrant.

```
exec ssh-add ansible_id_rsa
cd ../../
git clone https://github.com/AVENTER-UG/ansible-mesos-stack
cd ansible-mesos-stack
ansible-playbook -i ../mesos-vagrant/inventory/mesos_test plays/server-config.yaml
```

## Step 3: Login to mesos-ui

You can access the mesos ui via: http://192.168.56.51:5050

## Done

[Watch the Demo](https://peertube.aventer.biz/videos/embed/cc306313-4a5e-4c10-befa-04138290b1f4)


