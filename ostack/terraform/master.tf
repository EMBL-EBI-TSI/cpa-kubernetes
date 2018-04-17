resource "openstack_compute_instance_v2" "k8s-master" {
  flavor_name = "${var.machine_type}"
  key_pair    = "${var.name}-keypair"
  image_name  = "${var.disk_image_name}"
  name        = "${var.name}-k8s-master"

  network {
    name           = "${var.network_name}"
    access_network = true
  }

  security_groups = [
    "${openstack_compute_secgroup_v2.k8s-security.name}",
  ]
}

resource "openstack_compute_floatingip_associate_v2" "k8s-master_public_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.floatingip.address}"
  instance_id = "${openstack_compute_instance_v2.k8s-master.id}"
}
