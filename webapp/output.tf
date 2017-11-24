#output "public_ip" {
#	value = "${aws_instance.web.public_ip}"
#}

output "elb_public_ip" {
	value = "${aws_elb.elb_training.dns_name}"
}
