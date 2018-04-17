resource "openstack_compute_instance_v2" "k8s-node" {
  count       = "${var.node_instances}"
  flavor_name = "${var.machine_type}"
  key_pair    = "${var.name}-keypair"
  image_name  = "${var.disk_image_name}"
  name        = "${var.name}-k8s-node-${count.index + 1}"

  network {
    name           = "${var.network_name}"
    access_network = true
  }

  security_groups = [
    "${openstack_compute_secgroup_v2.k8s-security.name}",
  ]
}
