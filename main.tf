# Launch Instances
resource "aws_instance" "ec2-instance" {
    count   = "${var.instance_count}"

    ami                         = "${var.ami}"
    availability_zone           = "${element(var.availability_zone, count.index)}"
    ebs_optimized               = "${var.ebs_optimized}"
    instance_type               = "${var.instance_type}"
    monitoring                  = "${var.monitoring}"
    key_name                    = "${var.key_name}"
    iam_instance_profile        = "${var.iam_instance_profile}"
    subnet_id                   = "${element(var.subnet_id, count.index)}"
    vpc_security_group_ids      = "${var.vpc_security_group_ids}"
    associate_public_ip_address = "${var.associate_public_ip_address}"
    source_dest_check           = "${var.source_dest_check}"
    disable_api_termination     = "${var.disable_api_termination}"
    user_data                   = "${var.user_data}"

    dynamic "root_block_device" {
        for_each    = var.root_block_device
        content {
            volume_type             = root_block_device.value.volume_type
            volume_size             = root_block_device.value.volume_size
            delete_on_termination   = root_block_device.value.delete_on_termination
        }
    }

    dynamic "ebs_block_device" {
        for_each    = var.ebs_block_device
        content {
            device_name             = lookup(ebs_block_device.value, "device_name", null)
            encrypted               = lookup(ebs_block_device.value, "encrypted", null)
            iops                    = lookup(ebs_block_device.value, "iops", null)
            snapshot_id             = lookup(ebs_block_device.value, "snapshot_id", null)
            volume_type             = lookup(ebs_block_device.value, "volume_type", null)
            volume_size             = lookup(ebs_block_device.value, "volume_size", null)
            delete_on_termination   = lookup(ebs_block_device.value, "delete_on_termination", null)
        }
    }

    dynamic "ephemeral_block_device" {
        for_each = var.ephemeral_block_device
        content {
            device_name  = lookup(ephemeral_block_device.value, "device_name", null)
            virtual_name = lookup(ephemeral_block_device.value, "virtual_name", null)
        }
    }

    tags    = merge(
        {
            "Name"  = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name
        },
        "${var.default_tags}",
    )

    volume_tags = merge(
        {
            "Name"  = var.instance_count > 1 || var.use_num_suffix ? format("%s-%d", var.name, count.index + 1) : var.name

        },
        "${var.default_tags}"
    )

}
