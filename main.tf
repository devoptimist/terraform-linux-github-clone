data "template_file" "git_clone" {
  template = "${file("${path.module}/templates/clone.sh")}"

  vars {
    git_key  = "${var.git_key}",
    git_repo = "${var.git_repo_url}" 
  }
}

resource "null_resource" "git_clone" {
  count = "${var.workstation_count}"

  triggers {
    template = "${data.template_file.git_clone.rendered}"
  }

  connection {
    user     = "${var.ssh_user}"
    password = "${var.ssh_password}"
    host     = "${var.workstation_ips[count.index]}"
  }

  provisioner "file" {
    destination = "/tmp/git_clone.sh"
    content     = "${data.template_file.git_clone.rendered}"
  }

  provisioner "remote-exec" {
    inline = [
      "bash +x /tmp/git_clone.sh"
    ]
  }
}

