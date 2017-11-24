resource "aws_launch_configuration" "lc_training" {
  name_prefix   = "-lc-training-"
  image_id      = "ami-3df24344"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.sg_training.id}"]
  key_name = "davKey"
  user_data = "${data.template_file.temp_training.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg_training" {
  name                     = "${aws_launch_configuration.lc_training.name}"
  max_size                  = 2
  min_size                  = 2
  launch_configuration      = "${aws_launch_configuration.lc_training.name}"
  
  health_check_grace_period = 300
  health_check_type = "EC2"
  vpc_zone_identifier = ["${data.terraform_remote_state.rs-VPC.subnet_public}"]
  load_balancers = ["${aws_elb.elb_training.name}"]
  
  lifecycle {
    create_before_destroy = true
  }
 
}


resource "aws_elb" "elb_training" {
  name               = "elb-training"
  subnets = ["${data.terraform_remote_state.rs-VPC.subnet_public}"]
  security_groups= ["${aws_security_group.sg_training.id}"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

 health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 2
    target              = "HTTP:80/"
    interval            = 5
  }
}
