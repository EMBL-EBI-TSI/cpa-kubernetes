resource "null_resource" "ansible-provision" {
  depends_on = ["openstack_compute_instance_v2.k8s-master", "openstack_compute_instance_v2.k8s-node"]

  ##Create Masters Inventory
  provisioner "local-exec" {
    command = "echo \"[kube-master]\n${openstack_compute_instance_v2.k8s-master.name} ansible_ssh_host=${openstack_networking_floatingip_v2.floatingip.address}\" > ../ansible/inventory.ini"
  }

  ##Create ETCD Inventory
  provisioner "local-exec" {
    command = "echo \"\n[etcd]\n${openstack_compute_instance_v2.k8s-master.name} ansible_ssh_host=${openstack_networking_floatingip_v2.floatingip.address}\" >> ../ansible/inventory.ini"
  }

  provisioner "local-exec" {
    command = "echo \"\n[bastion]\" >> ../ansible/inventory.ini"
  }

  provisioner "local-exec" {
    command = "echo \"\nbastion ansible_ssh_host=${openstack_networking_floatingip_v2.floatingip.address}\" >> ../ansible/inventory.ini"
  }

  ##Create Nodes Inventory
  provisioner "local-exec" {
    command = "echo \"\n[kube-node]\" >> ../ansible/inventory.ini"
  }

  provisioner "local-exec" {
    command = "echo \"${join("\n",formatlist("%s ansible_ssh_host=%s", openstack_compute_instance_v2.k8s-node.*.name, openstack_compute_instance_v2.k8s-node.*.access_ip_v4))}\" >> ../ansible/inventory.ini"
  }

  provisioner "local-exec" {
    command = "echo \"\n[k8s-cluster:children]\nkube-node\nkube-master\" >> ../ansible/inventory.ini"
  }
}
